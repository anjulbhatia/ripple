import 'dart:convert';

import 'package:flutter/material.dart';

import 'component_catalog.dart';
import 'ui_schema.dart';

/// Interprets declarative UI JSON into real Flutter widgets.
///
/// Values live in-memory and, when [loadValues]/[saveValue] are provided
/// (runner passes Serverpod-backed ones), persist across sessions.
class UiRenderer extends StatefulWidget {
  const UiRenderer({
    super.key,
    required this.definitionJson,
    this.values = const {},
    this.loadValues,
    this.saveValue,
  });

  final String definitionJson;
  final Map<String, Object?> values;

  /// Loads persisted values (key -> raw value). Called once on init.
  final Future<Map<String, Object?>> Function()? loadValues;

  /// Persists one value change. Fire-and-forget from the UI.
  final Future<void> Function(String key, Object? value)? saveValue;

  @override
  State<UiRenderer> createState() => _UiRendererState();
}

class _UiRendererState extends State<UiRenderer> {
  late Map<String, Object?> _values;
  final _controllers = <String, TextEditingController>{};

  @override
  void initState() {
    super.initState();
    _values = Map.of(widget.values);
    final load = widget.loadValues;
    if (load != null) {
      load().then((stored) {
        if (!mounted) return;
        setState(() => _values.addAll(stored));
        for (final entry in stored.entries) {
          final controller = _controllers[entry.key];
          final text = '${entry.value ?? ''}';
          if (controller != null &&
              controller.text.isEmpty &&
              text.isNotEmpty) {
            controller.text = text;
          }
        }
      });
    }
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  TextEditingController _controllerFor(String key) => _controllers.putIfAbsent(
    key,
    () => TextEditingController(text: '${_values[key] ?? ''}'),
  );

  void _setAndPersist(String key, Object? value) {
    setState(() => _values[key] = value);
    widget.saveValue?.call(key, value);
  }

  void _handleAction(Map<String, Object?>? action) {
    final name = action?[UiActionKeys.action] as String?;
    final key = action?[UiActionKeys.key] as String?;
    if (name == null || key == null) return;
    switch (name) {
      case UiActions.increment:
        final inc = (action?[UiActionKeys.value] as num?)?.toInt() ?? 1;
        _setAndPersist(key, ((_values[key] as num?)?.toInt() ?? 0) + inc);
      case UiActions.toggle:
        _setAndPersist(key, !((_values[key] as bool?) ?? false));
      case UiActions.setValue:
        _setAndPersist(key, action?[UiActionKeys.value]);
      case UiActions.noop:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    late final Map<String, Object?> root;
    try {
      root = jsonDecode(widget.definitionJson) as Map<String, Object?>;
    } catch (_) {
      return const Center(child: Text('Invalid app definition'));
    }
    return _buildNode(context, root);
  }

  Color? _parseColor(Object? name) => switch (name) {
    'lime' => const Color(0xFFD3FB52),
    'olive' => const Color(0xFF052326),
    'white' => Colors.white,
    'black' => Colors.black87,
    'grey' || 'gray' => Colors.grey,
    'red' => Colors.red,
    'blue' => Colors.blue,
    'green' => Colors.green,
    _ => null,
  };

  TextStyle _textStyle(Map<String, Object?> node) {
    final style = (node[UiNodeKeys.style] as Map?)?.cast<String, Object?>();
    final fontSize = (style?['fontSize'] as num?)?.toDouble();
    final bold = (style?['fontWeight'] as String?) == 'bold';
    final color = _parseColor(style?['color']);
    return TextStyle(
      fontSize: fontSize,
      fontWeight: bold ? FontWeight.w700 : null,
      color: color,
    );
  }

  Widget _buildNode(BuildContext context, Map<String, Object?> node) {
    final type = node[UiNodeKeys.type] as String?;
    if (type == null || !ComponentCatalog.isSupported(type)) {
      return Text('Unsupported component: $type');
    }
    final children =
        (node[UiNodeKeys.children] as List?)
            ?.whereType<Map<String, Object?>>()
            .toList() ??
        const <Map<String, Object?>>[];
    switch (type) {
      case 'Column':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [for (final c in children) _buildNode(context, c)],
        );
      case 'Row':
        return Row(
          children: [
            for (final c in children) Expanded(child: _buildNode(context, c)),
          ],
        );
      case 'Text':
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            '${node[UiNodeKeys.text] ?? ''}',
            style: _textStyle(node),
          ),
        );
      case 'Button':
        final buttonStyle = (node[UiNodeKeys.style] as Map?)
            ?.cast<String, Object?>();
        final bg = _parseColor(buttonStyle?['background']);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ElevatedButton(
            style: bg == null
                ? null
                : ElevatedButton.styleFrom(backgroundColor: bg),
            onPressed: () => _handleAction(
              (node[UiNodeKeys.onClick] as Map?)?.cast<String, Object?>(),
            ),
            child: Text('${node[UiNodeKeys.label] ?? 'Button'}'),
          ),
        );
      case 'Card':
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [for (final c in children) _buildNode(context, c)],
            ),
          ),
        );
      case 'List':
        return Column(
          children: [for (final c in children) _buildNode(context, c)],
        );
      case 'ListItem':
        return ListTile(title: Text('${node[UiNodeKeys.text] ?? ''}'));
      case 'TextField':
        final key = node[UiActionKeys.key] as String? ?? 'field';
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextField(
            controller: _controllerFor(key),
            decoration: InputDecoration(
              labelText: '${node[UiNodeKeys.label] ?? key}',
            ),
            onSubmitted: (v) => _setAndPersist(key, v),
          ),
        );
      case 'Toggle':
        final key = node[UiActionKeys.key] as String? ?? 'toggle';
        return SwitchListTile(
          title: Text('${node[UiNodeKeys.label] ?? key}'),
          value: (_values[key] as bool?) ?? false,
          onChanged: (v) => _setAndPersist(key, v),
        );
      case 'Image':
        final url = node['url'] as String?;
        if (url == null || url.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Image.network(
            url,
            errorBuilder: (_, _, _) => const Text('Image failed to load'),
          ),
        );
      case 'Spacer':
        return const SizedBox(height: 12);
      case 'Divider':
        return const Divider();
      case 'BottomSheet':
        return OutlinedButton(
          onPressed: () => showModalBottomSheet<void>(
            context: context,
            builder: (_) => Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [for (final c in children) _buildNode(context, c)],
              ),
            ),
          ),
          child: Text('${node[UiNodeKeys.label] ?? 'Open'}'),
        );
    }
    return Text('Unsupported component: $type');
  }
}

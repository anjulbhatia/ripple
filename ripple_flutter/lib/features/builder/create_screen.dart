import 'package:flutter/material.dart';
import 'package:ripple_client/ripple_client.dart';

import '../../services/gallery_service.dart';
import '../../services/generate_service.dart';
import '../../ui_engine/ui_engine.dart';
import 'starter_templates.dart';

/// Create screen: prompt → AI-generated UI (Genkit) with live preview,
/// or a starter template. Saving stores the app in the gallery.
class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key, this.initialPrompt = ''});

  final String initialPrompt;

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _gallery = GalleryService();
  final _generate = GenerateService();
  late final TextEditingController _promptController;
  String _kind = StarterTemplates.kinds.first;
  bool _busy = false;
  bool _generating = false;
  String? _message;
  String? _previewJson;

  @override
  void initState() {
    super.initState();
    _promptController = TextEditingController(text: widget.initialPrompt);
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  String _appName(String prompt) =>
      prompt.length <= 40 ? prompt : '${prompt.substring(0, 40)}…';

  Future<void> _generateWithAi() async {
    final prompt = _promptController.text.trim();
    if (prompt.isEmpty) {
      setState(() => _message = 'Describe your app first.');
      return;
    }
    setState(() {
      _generating = true;
      _message = null;
      _previewJson = null;
    });
    try {
      final uiJson = await _generate.generateUi(prompt);
      if (!mounted) return;
      setState(() => _previewJson = uiJson);
    } on GenerateException catch (e) {
      if (mounted) setState(() => _message = e.message);
    } catch (_) {
      if (mounted) {
        setState(() => _message = 'AI generation failed. Try again.');
      }
    } finally {
      if (mounted) setState(() => _generating = false);
    }
  }

  Future<void> _save(String uiDefinition) async {
    final prompt = _promptController.text.trim();
    if (prompt.isEmpty) {
      setState(() => _message = 'Describe your app first.');
      return;
    }
    setState(() {
      _busy = true;
      _message = null;
    });
    try {
      final name = _appName(prompt);
      await _gallery.createApp(
        name: name,
        description: prompt,
        uiDefinition: uiDefinition,
      );
      if (!mounted) return;
      _promptController.clear();
      setState(() {
        _previewJson = null;
        _message = 'Created "$name". Find it in Your Apps.';
      });
    } catch (_) {
      if (mounted) setState(() => _message = 'Create failed. Try again.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final preview = _previewJson;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'What should we build?',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _promptController,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: 'e.g. A habit tracker for my morning routine…',
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: _generating ? null : _generateWithAi,
          icon: _generating
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.auto_awesome),
          label: Text(
            _generating ? 'Generating…' : 'Generate with AI',
          ),
        ),
        if (preview != null) ...[
          const SizedBox(height: 16),
          Text('Preview', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: UiRenderer(definitionJson: preview),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: _busy ? null : () => _save(preview),
            icon: const Icon(Icons.check),
            label: const Text('Save this app'),
          ),
        ],
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 8),
        Text(
          'Or start from a template',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            for (final kind in StarterTemplates.kinds)
              ChoiceChip(
                label: Text(kind),
                selected: _kind == kind,
                onSelected: (_) => setState(() => _kind = kind),
              ),
          ],
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: _busy
              ? null
              : () {
                  final prompt = _promptController.text.trim();
                  if (prompt.isEmpty) {
                    setState(
                      () => _message = 'Describe your app first.',
                    );
                    return;
                  }
                  final name = _appName(prompt);
                  _save(
                    StarterTemplates.build(title: name, kind: _kind),
                  );
                },
          icon: const Icon(Icons.dashboard_customize_outlined),
          label: const Text('Create from template'),
        ),
        if (_message != null) ...[
          const SizedBox(height: 12),
          Text(
            _message!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ],
    );
  }
}

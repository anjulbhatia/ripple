import 'package:flutter/material.dart';

import '../../services/gallery_service.dart';
import 'starter_templates.dart';

/// Create screen: ChatGPT-like prompt input + starter template.
/// Full agent-generated UI lands in the gen-UI step; today a prompt
/// plus template creates a real saved app.
class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key, this.initialPrompt = ''});

  final String initialPrompt;

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _gallery = GalleryService();
  late final TextEditingController _promptController;
  String _kind = StarterTemplates.kinds.first;
  bool _busy = false;
  String? _message;

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

  Future<void> _create() async {
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
      final name = prompt.length <= 40 ? prompt : '${prompt.substring(0, 40)}…';
      await _gallery.createApp(
        name: name,
        description: prompt,
        uiDefinition: StarterTemplates.build(title: name, kind: _kind),
      );
      if (!mounted) return;
      _promptController.clear();
      setState(() => _message = 'Created "$name". Find it in Your Apps.');
    } catch (_) {
      if (mounted) setState(() => _message = 'Create failed. Try again.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _busy ? null : _create,
            icon: _busy
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.auto_awesome),
            label: const Text('Create app'),
          ),
          if (_message != null) ...[
            const SizedBox(height: 12),
            Text(
              _message!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }
}

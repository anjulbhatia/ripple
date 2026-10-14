import 'dart:convert';

import 'package:genkit/genkit.dart';
import 'package:genkit_google_genai/genkit_google_genai.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'catalog.dart';

/// AI screen generation via Genkit (Gemini).
///
/// `generateUi` turns a natural-language prompt into catalog-valid
/// declarative UI JSON ready for `UiRenderer` and `AppDefinition`.
/// Needs `geminiApiKey` in `config/passwords.yaml` (gitignored) —
/// get one at https://aistudio.google.com. Without it the endpoint
/// throws [GenerateException] with [GenerateReason.notConfigured].
class GenerateEndpoint extends Endpoint {
  static const _model = 'gemini-flash-latest';

  Genkit _genkit(String apiKey) => Genkit(plugins: [googleAI(apiKey: apiKey)]);

  /// Generates declarative UI JSON for [prompt]. Validates output
  /// against the component catalog, retrying once on violation.
  Future<String> generateUi(Session session, String prompt) async {
    final brief = prompt.trim();
    if (brief.isEmpty || brief.length > 2000) {
      throw GenerateException(
        message: 'Describe your app in a few sentences.',
        reason: GenerateReason.invalidPrompt,
      );
    }

    final apiKey = session.passwords['geminiApiKey'];
    if (apiKey == null || apiKey.isEmpty) {
      throw GenerateException(
        message: 'AI is not configured yet (missing Gemini API key on server).',
        reason: GenerateReason.notConfigured,
      );
    }

    final ai = _genkit(apiKey);
    try {
      final first = await ai.generate(
        model: googleAI.gemini(_model),
        system: CatalogContract.systemPrompt,
        prompt: 'Build this personal app screen: $brief',
      );
      try {
        return CatalogContract.validate(_decode(first.text));
      } catch (_) {
        final retry = await ai.generate(
          model: googleAI.gemini(_model),
          system: CatalogContract.systemPrompt,
          prompt:
              'Your previous output violated the component contract. '
              'Output ONLY valid JSON using exactly the listed types and '
              'actions. Build this personal app screen: $brief',
        );
        return CatalogContract.validate(_decode(retry.text));
      }
    } catch (e) {
      if (e is GenerateException) rethrow;
      session.log('Genkit generateUi failed: $e');
      throw GenerateException(
        message: 'AI generation failed. Try again or use a starter.',
        reason: GenerateReason.generationFailed,
      );
    }
  }

  Object? _decode(String text) {
    var raw = text.trim();
    if (raw.startsWith('```')) {
      final start = raw.indexOf('{');
      final end = raw.lastIndexOf('}');
      if (start < 0 || end < 0) throw const FormatException('No JSON found');
      raw = raw.substring(start, end + 1);
    }
    return jsonDecode(raw);
  }
}

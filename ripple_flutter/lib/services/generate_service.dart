import '../client.dart';

/// AI screen generation via the server's Genkit endpoint.
class GenerateService {
  /// Returns catalog-valid declarative UI JSON for [prompt].
  /// Throws [GenerateException] (typed) on failure.
  Future<String> generateUi(String prompt) =>
      client.generate.generateUi(prompt);
}

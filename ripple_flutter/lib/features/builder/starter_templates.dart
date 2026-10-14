import 'dart:convert';

/// Starter declarative UI templates for the Create screen.
///
/// Full agent generation lands in the gen-UI step; these catalog-valid
/// starters make "create" real today.
abstract final class StarterTemplates {
  static const kinds = ['Counter', 'Habit tracker', 'Notes'];

  static String build({required String title, required String kind}) {
    final safe = title.trim().isEmpty ? 'My App' : title.trim();
    final Map<String, Object?> root = switch (kind) {
      'Habit tracker' => {
        'type': 'Column',
        'children': [
          {'type': 'Text', 'text': safe},
          {
            'type': 'Button',
            'label': 'Log today',
            'onClick': {'action': 'increment', 'key': 'streak', 'value': 1},
          },
          {'type': 'Toggle', 'key': 'done', 'label': 'Done today'},
        ],
      },
      'Notes' => {
        'type': 'Column',
        'children': [
          {'type': 'Text', 'text': safe},
          {'type': 'TextField', 'key': 'note', 'label': 'New note'},
          {
            'type': 'Button',
            'label': 'Save note',
            'onClick': {'action': 'setValue', 'key': 'saved', 'value': true},
          },
        ],
      },
      _ => {
        'type': 'Column',
        'children': [
          {'type': 'Text', 'text': safe},
          {
            'type': 'Button',
            'label': 'Tap me',
            'onClick': {'action': 'increment', 'key': 'count', 'value': 1},
          },
        ],
      },
    };
    return jsonEncode(root);
  }
}

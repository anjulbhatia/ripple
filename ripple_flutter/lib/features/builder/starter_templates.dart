import 'dart:convert';

/// Starter declarative UI templates for the Create screen.
///
/// Full agent generation lands in the gen-UI step; these catalog-valid
/// starters make "create" real today.
abstract final class StarterTemplates {
  static const kinds = [
    'Counter',
    'Habit tracker',
    'Notes',
    '3-Goal Planner',
  ];

  /// Instant demo app: daily 3-goal planner todo.
  static String threeGoalPlanner() => build(
    title: 'Daily 3-Goal Planner',
    kind: '3-Goal Planner',
  );

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
          {
            'type': 'Text',
            'text': safe,
            'style': {'fontSize': 24, 'fontWeight': 'bold'},
          },
          {'type': 'TextField', 'key': 'note', 'label': 'New note'},
          {
            'type': 'Button',
            'label': 'Save note',
            'onClick': {'action': 'setValue', 'key': 'saved', 'value': true},
          },
        ],
      },
      '3-Goal Planner' => {
        'type': 'Column',
        'children': [
          {
            'type': 'Text',
            'text': safe,
            'style': {'fontSize': 24, 'fontWeight': 'bold'},
          },
          {
            'type': 'Text',
            'text': 'Three goals. One day. No excuses.',
            'style': {'fontSize': 14},
          },
          for (var i = 1; i <= 3; i++) ...[
            {
              'type': 'Card',
              'children': [
                {'type': 'TextField', 'key': 'goal_$i', 'label': 'Goal $i'},
                {'type': 'Toggle', 'key': 'done_$i', 'label': 'Done'},
              ],
            },
          ],
          {
            'type': 'Button',
            'label': 'Log day complete',
            'style': {'background': 'lime'},
            'onClick': {'action': 'increment', 'key': 'days', 'value': 1},
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

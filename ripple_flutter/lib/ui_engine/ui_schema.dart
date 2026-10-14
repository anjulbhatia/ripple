/// Declarative UI schema contract (single source of truth).
///
/// Agent outputs a JSON tree like:
/// ```json
/// {"type": "Column", "children": [
///   {"type": "Text", "text": "Morning Habits"},
///   {"type": "Button", "label": "Log Water",
///    "onClick": {"action": "increment", "key": "water", "value": 1}}
/// ]}
/// ```
/// Rules: only types in [ComponentCatalog] allowed. Never free-form code.
library;

/// Schema version bumped whenever the catalog changes.
const uiSchemaVersion = 1;

/// Top-level node keys.
abstract final class UiNodeKeys {
  static const type = 'type';
  static const children = 'children';
  static const text = 'text';
  static const label = 'label';
  static const style = 'style';
  static const onClick = 'onClick';
}

/// Action keys inside onClick handlers.
abstract final class UiActionKeys {
  static const action = 'action';
  static const key = 'key';
  static const value = 'value';
}

/// Supported action names (v1).
abstract final class UiActions {
  static const increment = 'increment';
  static const setValue = 'setValue';
  static const toggle = 'toggle';
  static const noop = 'noop';
}

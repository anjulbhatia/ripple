import 'dart:convert';

/// Server-side mirror of the Flutter component catalog
/// (`ripple_flutter/lib/ui_engine/`).
///
/// The generator may ONLY emit these types/actions. [validate] enforces
/// the contract on model output before it is stored or sent to clients.
abstract final class CatalogContract {
  static const supportedTypes = <String>{
    'Column',
    'Row',
    'Text',
    'Button',
    'TextField',
    'Card',
    'List',
    'ListItem',
    'Image',
    'Toggle',
    'Spacer',
    'Divider',
    'BottomSheet',
  };

  static const supportedActions = <String>{
    'increment',
    'setValue',
    'toggle',
    'noop',
  };

  static const systemPrompt = '''
You design personal mobile app screens for Ripple. Output ONLY a single JSON object, no markdown fences, no commentary.

The JSON is a UI tree. Every node has a "type" (exactly one of: Column, Row, Text, Button, TextField, Card, List, ListItem, Image, Toggle, Spacer, Divider, BottomSheet) and optional "children" (array of nodes).

Node fields:
- Text: {"type":"Text","text":"..."}
- Button: {"type":"Button","label":"...","onClick":{"action":"...","key":"...","value":...}}
- TextField: {"type":"TextField","key":"...","label":"..."}
- Toggle: {"type":"Toggle","key":"...","label":"..."}
- ListItem: {"type":"ListItem","text":"..."}
- Image: {"type":"Image","url":"..."} (only use https image URLs you are confident exist, else omit images)
- BottomSheet: {"type":"BottomSheet","label":"...","children":[...]}
- Column, Row, Card, List: {"type":"...","children":[...]}
- Spacer: {"type":"Spacer"}  Divider: {"type":"Divider"}

onClick actions (exactly one of): increment (needs numeric key + value), setValue (needs key + value), toggle (needs boolean key), noop.
Keys are short snake_case value names like "water", "streak", "done".

Optional style maps for a designed look:
- Text: {"type":"Text","text":"...","style":{"fontSize":24,"fontWeight":"bold"}} (fontSize number, fontWeight bold or normal, color one of lime/olive/white/black/grey/red/blue/green)
- Button: {"type":"Button","label":"...","style":{"background":"lime"},"onClick":{...}} (background one of the same colors; default theme button otherwise)
Use a large bold title Text at the top of every screen.

Rules: root must be Column or Card. Keep screens small (3-8 nodes). Never invent types, fields, or actions. Personal single-user apps only: no chat, login, or social features inside the generated UI.
''';

  /// Validates decoded model output, returning canonical JSON.
  /// Throws [FormatException] on any contract violation.
  static String validate(Object? decoded) {
    _checkNode(decoded, path: 'root');
    return jsonEncode(decoded);
  }

  static void _checkNode(Object? node, {required String path}) {
    if (node is! Map) {
      throw FormatException('Node at $path is not an object');
    }
    final type = node['type'];
    if (type is! String || !supportedTypes.contains(type)) {
      throw FormatException('Unsupported type at $path: $type');
    }
    final children = node['children'];
    if (children != null) {
      if (children is! List) {
        throw FormatException('children at $path is not an array');
      }
      for (var i = 0; i < children.length; i++) {
        _checkNode(children[i], path: '$path.children[$i]');
      }
    }
    final onClick = node['onClick'];
    if (onClick != null) {
      if (onClick is! Map) {
        throw FormatException('onClick at $path is not an object');
      }
      final action = onClick['action'];
      if (action is! String || !supportedActions.contains(action)) {
        throw FormatException('Unsupported action at $path: $action');
      }
      if (action != 'noop' && onClick['key'] is! String) {
        throw FormatException('Missing key for action at $path');
      }
    }
  }
}

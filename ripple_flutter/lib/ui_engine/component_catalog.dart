/// Fixed component catalog. Agent may ONLY use these types.
abstract final class ComponentCatalog {
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

  static bool isSupported(String type) => supportedTypes.contains(type);
}

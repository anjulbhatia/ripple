import 'package:flutter/material.dart';

/// "Your Apps >" style header with a View All action.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
  });

  final String title;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        if (onViewAll != null)
          TextButton(
            onPressed: onViewAll,
            child: const Text('View All'),
          ),
      ],
    );
  }
}

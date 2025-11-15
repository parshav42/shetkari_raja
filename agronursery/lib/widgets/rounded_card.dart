import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RoundedCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const RoundedCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    if (onTap == null) return card;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: AppColors.blue.withOpacity(0.08),
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: card,
    );
  }
}

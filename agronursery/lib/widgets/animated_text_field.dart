import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';

class AnimatedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int delay;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const AnimatedTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.delay = 0,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: const Duration(milliseconds: 500),
          delay: Duration(milliseconds: delay),
        ),
      ],
      child: Material(
        color: Colors.transparent,
        child: TextFormField(
          controller: controller,
          style: const TextStyle(color: AppColors.textPrimary),
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(color: AppColors.textSecondary),
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white70,
            errorStyle: const TextStyle(color: Colors.red),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.blue, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFE0E3E7)),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final int delay;
  final ButtonStyle? style;
  final Widget? icon;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.delay = 0,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: const Duration(milliseconds: 500),
          delay: Duration(milliseconds: delay),
        ),
      ],
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  Text(text),
                ],
              )
            : Text(text),
      ),
    );
  }
}

class AnimatedTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final int delay;
  final ButtonStyle? style;
  final Widget? icon;

  const AnimatedTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.delay = 0,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: const Duration(milliseconds: 500),
          delay: Duration(milliseconds: delay),
        ),
      ],
      child: TextButton(
        onPressed: onPressed,
        style: style,
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  Text(text),
                ],
              )
            : Text(text),
      ),
    );
  }
}
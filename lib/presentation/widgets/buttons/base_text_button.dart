import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef TextButtonCallback = void Function();

enum ButtonType { textOnly, outline, filled }

extension ButtonTypeExt on ButtonType {
  bool get isFilled => this == ButtonType.filled;

  bool get isOutline => this == ButtonType.outline;
}

class BaseTextButton extends StatelessWidget {
  const BaseTextButton(
      {required this.callback,
      required this.text,
      this.type = ButtonType.filled,
      this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      super.key});

  final EdgeInsets padding;
  final TextButtonCallback callback;
  final String text;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: padding,
        onPressed: callback,
        child: Row(children: [
          Expanded(
              child: Container(
                  height: 55,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: type.isOutline
                          ? Border.all(color: Colors.blue)
                          : null,
                      color: type.isFilled ? Colors.blue : null),
                  child: Center(child: Text(text))))
        ]));
  }
}

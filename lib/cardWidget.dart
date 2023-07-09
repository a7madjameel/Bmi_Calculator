import 'package:flutter/material.dart';

class cardWidget extends StatefulWidget {
  final String? text;
  final IconData? icon;
  final int selector;
  final int thisIndex;
  final Function()? onTap;
  const cardWidget(
      {required this.thisIndex,
      required this.selector,
      this.onTap,
      this.icon,
      this.text,
      super.key});

  @override
  State<cardWidget> createState() => _cardWidgetState();
}

class _cardWidgetState extends State<cardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: widget.selector == widget.thisIndex
                ? const Color(0xff24263B)
                : Theme.of(context).colorScheme.primary,
          ),
          child: Column(
            children: [
              Icon(
                widget.icon,
                size: 90,
              ),
              const SizedBox(height: 16),
              Text(widget.text ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24)),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

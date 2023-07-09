import 'package:flutter/material.dart';

class dataCard extends StatefulWidget {
  final String? text;
  final int? value;
  final Function()? minus;
  final Function()? positive;
  const dataCard({this.minus, this.positive, this.value, this.text, super.key});

  @override
  State<dataCard> createState() => _dataCardState();
}

class _dataCardState extends State<dataCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              widget.text ?? '',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              '${widget.value}' ?? '',
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 32),
            ),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              InkWell(
                onTap: widget.minus,
                child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey.shade700,
                    child: const Icon(Icons.remove)),
              ),
              InkWell(
                onTap: widget.positive,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey.shade700,
                  child: const Icon(Icons.add),
                ),
              ),
            ]),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

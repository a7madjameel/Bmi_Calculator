import 'package:flutter/material.dart';

class result extends StatelessWidget {
  int? weight;
  double? height;
  List<String> results = [
    'Very severely underweight',
    'Severely underweight',
    'Underweight',
    'Normal',
    'Overweight',
    'Moderately obese',
    'Severely obese',
    'Very severely obese',
  ];
  result({required this.weight, required this.height, super.key});
  @override
  Widget build(BuildContext context) {
    double res = weight! / ((height! / 100) * (height! / 100));
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            const SizedBox(height: 120),
            const Text(
              'Result',
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
                res < 15
                    ? results[0]
                    : res < 16
                        ? results[1]
                        : res < 18.5
                            ? results[2]
                            : res < 25
                                ? results[3]
                                : res < 30
                                    ? results[4]
                                    : res < 35
                                        ? results[5]
                                        : res < 40
                                            ? results[6]
                                            : results[7],
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Text(
              res.toStringAsPrecision(2),
              style: const TextStyle(
                fontSize: 128,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 80,
                alignment: Alignment.center,
                color: Theme.of(context).colorScheme.secondary,
                child: const Text(
                  'Recalculate',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

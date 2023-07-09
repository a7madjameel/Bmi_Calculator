import 'package:bmi_tt9/cardWidget.dart';
import 'package:bmi_tt9/dataCard.dart';
import 'package:bmi_tt9/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff1D2136),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: const Color(0xffE83D66),
              primary: const Color(0xff323244),
            ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.grey[900],
        ),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 150;
  int gender = -1;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Row(children: [
            Expanded(
                child: cardWidget(
              selector: gender,
              thisIndex: 1,
              text: 'Male',
              icon: Icons.male,
              onTap: () {
                setState(() {
                  if (gender != 1) {
                    gender = 1;
                  } else {
                    gender = -1;
                  }
                });
              },
            )),
            Expanded(
                child: cardWidget(
              selector: gender,
              thisIndex: 0,
              text: 'Female',
              icon: Icons.female,
              onTap: () {
                setState(() {
                  if (gender != 0) {
                    gender = 0;
                  } else {
                    gender = -10;
                  }
                });
              },
            )),
          ]),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: InkWell(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    const Text(
                      'Height',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '${height.round()} CM',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 16),
                    Slider(
                      activeColor: Theme.of(context).colorScheme.secondary,
                      inactiveColor: Colors.grey.shade700,
                      min: 50,
                      thumbColor: Colors.red,
                      max: 300,
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(children: [
            Expanded(
                child: dataCard(
              positive: () {
                if (weight < 200) {
                  setState(() {
                    weight++;
                  });
                }
              },
              minus: () {
                if (weight > 20) {
                  setState(() {
                    weight--;
                  });
                }
              },
              text: 'Weight',
              value: weight,
            )),
            Expanded(
                child: dataCard(
              text: 'Age',
              minus: () {
                if (age > 1) {
                  setState(() {
                    age--;
                  });
                }
              },
              positive: () {
                if (age < 110) {
                  setState(() {
                    age++;
                  });
                }
              },
              value: age,
            )),
          ]),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => result(
                          weight: weight,
                          height: height,
                        ))),
            child: Container(
              height: 60,
              alignment: Alignment.center,
              color: Theme.of(context).colorScheme.secondary,
              child: const Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

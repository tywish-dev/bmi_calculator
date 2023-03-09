import 'package:bmi_calculator/ui/providers/bmi_provider.dart';
import 'package:bmi_calculator/ui/view/screens/result_screen.dart';
import 'package:provider/provider.dart';

import '/ui/view/widgets/slider_card.dart';
import '/ui/view/widgets/gender_card.dart';
import '/ui/view/widgets/numeric_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bmiProvider = Provider.of<BmiProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              GenderCard(
                gender: 1,
              ),
              GenderCard(
                gender: 0,
              ),
            ],
          ),
          Container(
            width: size.width * 0.78,
            height: size.height * 0.25,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 26, 23, 29),
                borderRadius: BorderRadius.circular(15)),
            child: const SliderCard(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              NumericCard(
                numeric: 0,
              ),
              NumericCard(
                numeric: 1,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: size.height * 0.12,
        child: GestureDetector(
          onTap: () {
            bmiProvider.calculateBmi();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ResultScreen()));
          },
          child: const Center(
              child: Text(
            "CALCULATE YOUR BMI",
            style: TextStyle(fontSize: 26, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

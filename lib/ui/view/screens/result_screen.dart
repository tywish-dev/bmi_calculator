import 'package:bmi_calculator/ui/providers/bmi_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bmiProvider = Provider.of<BmiProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Result',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                width: size.width * 0.78,
                height: size.height * 0.6,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 26, 23, 29),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiProvider.getBmiDegree,
                      style: TextStyle(
                          fontSize: 36,
                          color: bmiProvider.getColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      bmiProvider.getBmiResult.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 120, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiProvider.getBmiDesc,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

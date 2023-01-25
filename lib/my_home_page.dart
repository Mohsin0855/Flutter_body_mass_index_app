import 'package:flutter/material.dart';

class my_home_page extends StatefulWidget {
  const my_home_page({super.key});

  @override
  State<my_home_page> createState() => _my_home_page();
}

class _my_home_page extends State<my_home_page> {
  var wtController = TextEditingController();
  var inController = TextEditingController();
  var ftController = TextEditingController();
  var result = '';
  var bgColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Body Mass Index App')),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Wieght (in KG)'),
                        prefix: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Height (in feet)'),
                        prefix: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Height (in Inch)'),
                        prefix: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();
                        if (wt != '' && ft != '' && inch != '') {
                          // BMI Calculations
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);
                          var tInch = (iFt * 12) + iInch;

                          // inch to cm
                          var tCm = tInch * 2.84;

                          // cm to meter
                          var tM = tCm / 100;
                          // calculate
                          var bmi = iWt / (tM * tM);
                          // to change bgcolor
                          var msg;
                          if (bmi < 18) {
                            msg = 'You are under Weight';
                            bgColor = Colors.red.shade200;
                          } else if (bmi > 25) {
                            msg = 'You are Over Weight';
                            bgColor = Colors.yellow.shade200;
                          } else {
                            msg = 'You are healthy';
                            bgColor = Colors.green.shade200;
                          }
                          setState(() {
                            result =
                                '$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}';
                          });
                        } else {
                          setState(() {
                            result = 'Please fill all required fields';
                          });
                        }
                      },
                      child: const Text('Calculate')),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

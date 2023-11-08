import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade900),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )),
      home: const MyHomePage(
        title: "",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weight = TextEditingController();
  var feet = TextEditingController();
  var inches = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI Calculator')),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "BMI",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.lightBlue.shade900),
                )),
                TextField(
                  controller: weight,
                  decoration: const InputDecoration(
                      label: Text('Enter Your Weight In KG'),
                      prefixIcon: Icon(Icons.line_axis)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: feet,
                  decoration: const InputDecoration(
                      label: Text('Enter Your Height In Feet'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: inches,
                  decoration: const InputDecoration(
                      label: Text('Enter Your Height In Inches'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      var w = weight.text.toString();
                      var f = feet.text.toString();
                      var i = inches.text.toString();

                      if (w != '' && f != '' && i != '') {
                        var w2 = int.parse(w);
                        var f2 = int.parse(f);
                        var i2 = int.parse(i);

                        var totalInches = (f2 * 12) + i2;
                        var totalCm = totalInches * 2.54;
                        var totalMeter = totalCm / 100;
                        var bmi = w2 / (totalMeter * totalMeter);
                        var msg = '';

                        if (bmi > 25) {
                          msg = "You're OverWeight ";
                        } else if (bmi < 18) {
                          msg = "You're UnderWeight ";
                        } else {
                          msg = "You're Healthy ";
                        }
                        setState(() {
                          result =
                              '$msg \n Your BMI is: ${bmi.toStringAsFixed(3)}';
                        });
                      } else if (w == '' || f == '' || i == '') {
                        setState(() {
                          result = "* ALL Fields Are Required";
                        });
                      }
                    },
                    child: const Text(
                      "Calculate",
                      style: TextStyle(fontSize: 15),
                    )),
                Text(
                  result,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
  }
}

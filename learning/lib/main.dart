import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      color: Colors.redAccent[950],
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String greet = "Click here!";
  void updateGreeting() {
    // 1. Immediately change the text to "Greetings!"
    setState(() {
      greet = "Greetings!";
    });

    // 2. Start a 2-second background timer
    Future.delayed(Duration(seconds: 1), () {
      // 3. When the 2 seconds are up, reset the text
      if (mounted) {
        setState(() {
          greet = "Click to greet!";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App",
          style: TextStyle(
            color: Colors.pinkAccent[200],
            fontFamily: "BBH_Bogle",
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 170, 227),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.purpleAccent[500],
            child: Column(
              children: <Widget>[
                Center(
                  child: ElevatedButton(
                    // When pressed, trigger the state update function
                    onPressed: () => updateGreeting(),
                    // Display the current value of the greet variable
                    child: Text(greet),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

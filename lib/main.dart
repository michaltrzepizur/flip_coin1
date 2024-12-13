import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

final wishController = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 233, 33),
        title: const Text("Rzuć monetą"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Wypisz pytanie i rzuć monetą"),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: wishController,
                decoration: const InputDecoration(hintText: 'Wpisz pytanie'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 237, 230, 17),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SecondPage(),
                      ),
                    );
                  },
                  child: const Text('Rzuć monetą'))
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final result = random.nextBool();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rzuć monetą'),
          backgroundColor: result == true ? Colors.green : Colors.red,
        ),
        backgroundColor: result == true
            ? const Color.fromARGB(255, 152, 226, 188)
            : const Color.fromARGB(255, 237, 149, 143),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (result == true) Text('Tak'),
              if (result == false) Text('Nie'),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('zadaj nowe pytanie'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: result == true ? Colors.green : Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ));
  }
}

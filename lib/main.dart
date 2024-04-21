import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => Counter(),
    child:  const MyApp()
    )
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CounterApp(title: 'Sample Code'),
    );
  }
}

class Counter with ChangeNotifier {
  int _number = 0;

  int get number => _number;
  void increment() {
    _number++;
    notifyListeners();
  }
  void decrement() {
    _number--;
    notifyListeners();
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp ({super.key, required this.title});


  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sample Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              ' ${Provider.of<Counter>(context).number}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<Counter>(context, listen:false).decrement(),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

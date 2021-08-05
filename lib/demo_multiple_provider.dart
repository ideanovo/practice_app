import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter1 with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  increment() {
    _count++;
    notifyListeners();
  }
}

class Counter2 with ChangeNotifier {
  int _count = 10;
  int get count => _count;

  increment() {
    _count++;
    notifyListeners();
  }
}

class Counter3 with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  increment() {
    _count++;
  }
}

class Counter4 with ChangeNotifier {
  int _count = 10;
  int get count => _count;

  increment() {
    _count++;
  }
}

class DemoMultipleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Counter3>.value(value: Counter3()),
        Provider<Counter4>.value(value: Counter4()),
      ],
      child: TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter3 counter3 = Provider.of<Counter3>(context);
    Counter4 counter4 = Provider.of<Counter4>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Count 1: ${counter3.count.toString()} Count 2: ${counter4.count.toString()}',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              counter3.increment();
              counter4.increment();
            },
            child: Text(
              "Increment",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

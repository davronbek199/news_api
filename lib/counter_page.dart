import 'package:flutter/material.dart';
import 'package:news_api/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Provider.of<CounterProvider>(context, listen: false).increment();
              },
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Consumer<CounterProvider>(builder: (_, counterProvider, child) {
              return Text(counterProvider.index.toString());
            }),
            GestureDetector(
              onTap: () {
                Provider.of<CounterProvider>(context, listen: false).decrement();
              },
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

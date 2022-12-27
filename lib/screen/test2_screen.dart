import 'package:dusty_dust/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestTwoScreen extends StatelessWidget {
  const TestTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Two Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder<Box>(
            valueListenable: Hive.box(testBox).listenable(),
            builder: (context, box, widget) {

              return Column(
                children: box.values
                    .map(
                      (e) => Text(
                    e.toString(),
                  ),
                )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

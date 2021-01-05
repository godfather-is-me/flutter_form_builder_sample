import 'package:flutter/material.dart';
import 'package:flutter_form_build_sample/csv.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CsvApp(),
    );
  }
}

class FormSample extends StatelessWidget {
  // Key is used globally for validation
  final _fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form sample'),
        ),
        body: FormBuilder(
          key: _fbKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text('Submit'),
                    // On pressed will submit values only if key is valid
                    onPressed: () {
                      if (_fbKey.currentState.saveAndValidate()) {
                        print(_fbKey.currentState.value);
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text('Reset'),
                    // To clear all inputs we use the reset method
                    onPressed: () {
                      _fbKey.currentState.reset();
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

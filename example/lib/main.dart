import 'package:flutter/material.dart';
import 'package:jsonview/jsonview.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() { 
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar( 
        title: Text(widget.title),
      ),
      body: JsonToWidget({
        "@type": "Column",
        "children": [
          {
            "@type": "Padding",
            "padding": {
              "@type": "all",
              "value": _counter,
            },
            "child": {
              "@type": "Center",
              "child": {
                "@type": "Container",
                "child": {
                  "@type": "Text",
                  "data": "Hello world ${_counter}",
                }
              }
            },
          },
          {
            "@type": "Center",
            "child": {
              "@type": "Container",
              "child": {
                "@type": "Text",
                "data": "Hello world ${_counter}",
              }
            }
          },
        ]
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

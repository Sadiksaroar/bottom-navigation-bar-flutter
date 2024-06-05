import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(
        currentIndex: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;

  const Homepage({
    Key? key,
    required this.currentIndex,
    required this.onIndexChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onIndexChanged,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Message",
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Call",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pan_tool),
            label: "Pan Tool",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio),
            label: "Radio",
          )
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          OnePage(),
          TwoPage(),
          ThreePage(),
          FourPage(),
        ],
      ),
    );
  }
}

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Page One"),
    );
  }
}

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Page Two"),
    );
  }
}

class ThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Page Three"),
    );
  }
}

class FourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Page Four"),
    );
  }
}

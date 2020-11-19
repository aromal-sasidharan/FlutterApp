import 'package:flutter/material.dart';
import 'package:myprofile/ui-components/Drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Widget mainPage = MyHomePage(title: 'Flutter Demossssssss Home Page');
    ThemeData theme = ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.red,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: mainPage,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    var label1 = Text(
      'You have pushed the buttons this many times:',
    );
    var labelCounter =  Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    );
    List<Widget> wigets = [label1,labelCounter];
    SideMenu menu = SideMenu();
    Widget view = Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: wigets));
    AppBar appBar = AppBar(title: Text(widget.title));
    FloatingActionButton button = FloatingActionButton(tooltip: "Increment",
        onPressed: _incrementCounter,child: Icon(Icons.add));
    return Scaffold(
      appBar: appBar,
      drawer: menu,
      body: view,
      floatingActionButton: button
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myprofile/ui-components/Drawer.dart';
import 'package:rxdart/rxdart.dart';
import 'domain/Domain.dart' as Domain;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget mainPage = MyHomePage(title: 'Flutter Demossssssss Home Page');
    ThemeData theme = ThemeData(
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
  PublishSubject sideMenuTapped = PublishSubject<Domain.SideMenuVM>();

  List<Domain.SideMenuVM> menus = List();


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

  void initState() {
    debugPrint("void initState");
    super.initState();
    menus.addAll([
      Domain.SideMenuVM(name: "Projects", type: Domain.SideMenuType.MAIN),
      Domain.SideMenuVM(name: "Contact")
    ]);
    sideMenuTapped.stream.listen((event) {
      debugPrint("Hello1");
      _incrementCounter();
      updateMenu();
      // Navigator.pop(context);
    });
  }
  void updateMenu() {
    setState(() {
      var item = Domain.SideMenuVM(name: "$_counter",
          type: Domain.SideMenuType.MAIN);
      menus.add(item);
    });
  }
  Widget body(BuildContext context) {
    var label1 = Text(
      'You have pushed the buttons this many times:',
    );
    var labelCounter = Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    );
    List<Widget> widgets = [label1, labelCounter];
    Widget view = Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets
        )
    );
    return view;
  }

  SideMenuView get menu {
    SideMenuView menuView = SideMenuView(litems: menus);
    menuView.onTapSubject.listen((event) {
      sideMenuTapped.add(event);
    });
    return menuView;
  }

  FloatingActionButton get floattingButton {
    return FloatingActionButton(
        tooltip: "Increment",
        onPressed: _incrementCounter,
        child: Icon(Icons.add));
  }

  AppBar get appBar {
    return AppBar(title: Text(widget.title));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    debugPrint("Widget build");
    return Scaffold(
        appBar: appBar,
        drawer: menu,
        body: body(context),
        floatingActionButton: floattingButton);
  }
}

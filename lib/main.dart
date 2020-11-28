import 'package:flutter/material.dart';
import 'package:myprofile/ui-components/Drawer.dart';
import 'package:rxdart/rxdart.dart';
import 'domain/Domain.dart' as Domain;
import 'package:user_profile/src/profile_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget mainPage = MyHomePage(title: 'My Profile');
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
    debugPrint("${this.runtimeType} initState");
    super.initState();
    setupMenus();
  }


  Widget body(BuildContext context) {
    ProfilePage page = ProfilePage();
    // var label1 = Text(
    //   'You have pushed the buttons this many times:',
    // );
    // var labelCounter = Text(
    //   '$_counter',
    //   style: Theme.of(context).textTheme.headline4,
    // );

    // List<Widget> widgets = [page];
    // Widget view = Center(
    //     child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: widgets
    //     )
    // );
    return page;
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
    return  AppBar(
      // title: new Text(
      //   widget.title,
      //   style: TextStyle(color: Colors.amber),
      // ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    debugPrint("${this.runtimeType} Widget build");
    final scaffold = 
          Scaffold(
            extendBodyBehindAppBar: true,
            drawer: menu,
            backgroundColor: Colors.transparent,
            appBar:appBar,
            body: body(context),
          );

    // return Scaffold(
    //     appBar: appBar,
    //     drawer: menu,
    //     body: body(context),
    //     floatingActionButton: floattingButton);
    return  scaffold;
  }
}


extension HomePageSetup on _MyHomePageState {
  void setupMenus() {
    List<Domain.SideMenuVM> menuItems = Domain.Scene.values.map((Domain.Scene e)  {

      return Domain.SideMenuVM(name: "${e.value}", type: Domain.SideMenuType.LIST,scene:e);
    }).toList();
    menus.addAll(
        menuItems
    );
    sideMenuTapped.stream.listen((event) {
      debugPrint("Hello1 $event");
      Navigator.pop(context);
      if (event is Domain.SideMenuVM) {
        navigate(event);
      }

    });
  }
}


extension MyNavigator on _MyHomePageState {

  void navigate(Domain.SideMenuVM vm) {
    debugPrint("Hello2 $vm");
    switch (vm.scene) {

      case Domain.Scene.Profile:
      // TODO: Handle this case.
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
      case Domain.Scene.Contact:
      // TODO: Handle this case.
        break;
      case Domain.Scene.Projects:
      // TODO: Handle this case.
        break;
    }
  }
}
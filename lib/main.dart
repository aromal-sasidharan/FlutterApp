import 'package:flutter/material.dart';
import 'package:ui_kit/components/Drawer.dart';
import 'package:ui_kit/components/Scaffold.dart' as Scaffold;
import 'package:rxdart/rxdart.dart';
import 'package:domain/domain.dart' as Domain;
import 'package:profile_header/profile_page.dart';
import 'package:ui_kit/theme/Theme.dart' as AppTheme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget mainPage = MyHomePage(title: 'My Profile');
    ThemeData theme = AppTheme.appThemeData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: mainPage,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  PublishSubject sideMenuTapped = PublishSubject<Domain.SideMenuVM>();

  List<Domain.SideMenuVM> menus = List();

  void initState() {
    debugPrint("${this.runtimeType} initState");
    super.initState();
    setupMenus();
  }

  Widget body(BuildContext context) {
    List<Widget> widgets = [ProfilePage()];
    ListView view = ListView(
      padding: EdgeInsets.zero,
      children: widgets,
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    debugPrint("${this.runtimeType} Widget build");
    final scaffold = Scaffold.scaffold(
      context: context,
      body: body(context),
      sideMenu: menu,
    );

    return scaffold;
  }
}

extension HomePageSetup on _MyHomePageState {
  void setupMenus() {
    List<Domain.SideMenuVM> menuItems =
        Domain.Scene.values.map((Domain.Scene e) {
      return Domain.SideMenuVM(
          name: "${e.value}", type: Domain.SideMenuType.LIST, scene: e);
    }).toList();
    menus.addAll(menuItems);
    sideMenuTapped.stream.listen((event) {
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Scaffold.scaffold(
            context: context,
            body: ProfilePage(),
        )));
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

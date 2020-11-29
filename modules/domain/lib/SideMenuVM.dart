part of "domain.dart";
enum SideMenuType {
  MAIN,
  HEADER,
  LIST,
}

class SideMenuVM {
  final String name;
  final SideMenuType type;
  final Scene scene;
  SideMenuVM({this.name,this.type = SideMenuType.LIST, this.scene});

}
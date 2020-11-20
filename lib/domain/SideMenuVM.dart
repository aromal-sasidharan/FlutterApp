

part of 'Domain.dart';
enum SideMenuType {
  MAIN,
  HEADER,
  LIST,
}

class SideMenuVM {
  final String name;
  final SideMenuType type;
  SideMenuVM({this.name,this.type = SideMenuType.LIST});
}
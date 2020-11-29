part of "domain.dart";

enum Scene {
  Profile,
  Contact,
  Projects
}

extension SceneExtension on Scene {
  String get value {
    return this.toString().split('.').last;
  }
}

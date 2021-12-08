import 'package:base_widget/data/local/db_constant.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? phone;

  User({this.name, this.email, this.phone});

  User.fromMap(Map<String, dynamic> map) {
    id = map[DBConstant.colUserId];
    name = map[DBConstant.colUserName];
    email = map[DBConstant.colUserEmail];
    phone = map[DBConstant.colUserPhone];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map[DBConstant.colUserName] = name;
    map[DBConstant.colUserEmail] = email;
    map[DBConstant.colUserPhone] = phone;
    return map;
  }
}

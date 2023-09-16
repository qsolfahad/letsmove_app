import 'model/data/userInfo.dart';

class Global {
  UserInfo? user;
    static final Global _instance = Global._internal();


  addUser(UserInfo user_) {
    user = user_;
  }

   Global._internal();

  factory Global() {
    return _instance;
  }
}

import 'dart:async';

import 'package:chamcongapp/validations/validations.dart';

class RegisterStream {
  StreamController _usernameController = StreamController.broadcast();
  StreamController _passController = StreamController.broadcast();
  StreamController _nameController = StreamController.broadcast();
  Stream get usernameStream => _usernameController.stream;
  Stream get passStream => _passController.stream;
  Stream get nameStream => _nameController.stream;

  bool isValidInfo({String username, String password, String name}) {
    bool status = true;
    if (!Validations.isValidUser(username)) {
      _usernameController.sink.addError("Tài khoản sai quy định");
      status = false;
    } else {
      _usernameController.sink.add("Thành công");
    }
    if (!Validations.isValidUser(password)) {
      _passController.sink.addError("Mật khẩu sai quy định ");
      status = false;
    } else {
      _passController.sink.add("Thành công");
    }
    if (!Validations.isValidUser(name)) {
      _nameController.sink.addError("Họ và tên sai quy định");
      status = false;
    } else {
      _nameController.sink.add("Thành công");
    }
    return status;
  }

  void dispose() {
    _nameController.close();
    _passController.close();
    _usernameController.close();
  }
}
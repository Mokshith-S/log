import 'package:log/model/login_model.dart';

UserDetail userOne = UserDetail(user: 'Test1', pass: 'test1');
UserDetail userTwo = UserDetail(user: 'Test2', pass: 'test2');

Map<String, UserDetail> usersData = {userOne.id: userOne, userTwo.id: userTwo};

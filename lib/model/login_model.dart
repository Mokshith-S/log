import 'package:uuid/uuid.dart';
import 'package:encrypt/encrypt.dart';

final key = Key.fromSecureRandom(32);
final initVector = IV.fromSecureRandom(16);
final encrypter = Encrypter(AES(key));
const idGenerator = Uuid();

class UserDetail {
  final String id;
  final String _username;
  final Encrypted _password;

  UserDetail({required user, required pass})
      : _username = user,
        _password = encrypter.encrypt(pass, iv: initVector),
        id = idGenerator.v5(Uuid.NAMESPACE_URL, user);

  bool validate(String name, String entryCode) {
    return name == _username
        ? encrypter.encrypt(entryCode, iv: initVector) == _password
            ? true
            : false
        : false;
  }
}

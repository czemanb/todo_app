import 'package:firebase_auth/firebase_auth.dart' as firebase_auth show User;
import 'package:todo_app/domain/auth/user.dart';
import 'package:todo_app/domain/core/value_objects.dart';

extension FirebaseUserDomainX on firebase_auth.User {
    User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
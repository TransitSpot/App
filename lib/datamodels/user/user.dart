import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@Freezed()
class User with _$User {
  const factory User({
    required String email,
    required String name,
    required String photoUrl,
    @Default(true) bool isDriver,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

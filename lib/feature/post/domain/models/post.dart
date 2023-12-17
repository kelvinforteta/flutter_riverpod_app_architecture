import 'package:equatable/equatable.dart';

class HomeUser extends Equatable {
  final String name;
  final String email;
  final String username;
  final String phoneNumber;

  const HomeUser(
      {required this.name,
      required this.email,
      required this.username,
      required this.phoneNumber});

  @override
  List<Object?> get props => [name, email, username, phoneNumber];
}

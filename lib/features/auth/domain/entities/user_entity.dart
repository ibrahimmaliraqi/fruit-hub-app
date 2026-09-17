// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  final String uId;
  final String email;
  final String name;
  final String? image;

  UserEntity({
    required this.uId,
    required this.email,
    required this.name,
    this.image,
  });
}

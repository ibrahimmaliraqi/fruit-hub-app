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

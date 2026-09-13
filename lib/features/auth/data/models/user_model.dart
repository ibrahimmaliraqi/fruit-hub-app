import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uId,
    required super.email,
    super.image,
    required super.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uId': uId,
      'name': name,
      'email': email,
      'image': image,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      uId: uId,
      email: email,
      image: image,
      name: name,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uId: map['uId'] as String,
      image: map['image'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }
}

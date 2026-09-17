import 'package:firebase_auth/firebase_auth.dart';
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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uId: map['uId'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }
  UserEntity toEntity() {
    return UserEntity(
      uId: uId,
      email: email,
      image: image,
      name: name,
    );
  }

  UserModel copyWith({
    String? uId,
    String? email,
    String? name,
    String? image,
  }) {
    return UserModel(
      uId: uId ?? this.uId,
      email: email ?? this.email,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      image: user.photoURL,
      email: user.email!,
      name: user.displayName ?? '',
    );
  }
}

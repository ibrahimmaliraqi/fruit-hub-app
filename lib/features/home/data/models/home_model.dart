import '../../domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required super.id,
  });

  factory HomeModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return HomeModel(
      id: map['id'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }
}
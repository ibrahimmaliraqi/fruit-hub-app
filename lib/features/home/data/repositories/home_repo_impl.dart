import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<HomeEntity> getHome() async {
    throw UnimplementedError();
  }
}
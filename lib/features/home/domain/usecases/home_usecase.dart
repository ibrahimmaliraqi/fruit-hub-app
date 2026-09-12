import '../entities/home_entity.dart';
import '../repositories/home_repo.dart';

class HomeUseCase {
  final HomeRepo repository;

  HomeUseCase({
    required this.repository,
  });

  Future<HomeEntity> call() async {
    return repository.getHome();
  }
}
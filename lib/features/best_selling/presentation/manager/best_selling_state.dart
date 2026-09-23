part of 'best_selling_cubit.dart';

sealed class BestSellingState {}

final class BestSellingInitial extends BestSellingState {}

final class BestSellingLoading extends BestSellingState {}

final class BestSellingSuccess extends BestSellingState {}

final class BestSellingFailure extends BestSellingState {
  final String message;

  BestSellingFailure({
    required this.message,
  });
}
part of 'pos_cubit.dart';

@immutable
sealed class PosState {}

final class PosInitial extends PosState {}

final class PosStateItemToCart extends PosState {}

final class PosStateRemoveItem extends PosState {}

final class PosStateClearCart extends PosState {}

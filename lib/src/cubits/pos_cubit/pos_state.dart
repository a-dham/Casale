part of 'pos_cubit.dart';

sealed class PosState {}

final class PosInitial extends PosState {}

final class PosStateItemToCart extends PosState {}

final class PosStateRemoveItem extends PosState {}

final class PosStateClearCart extends PosState {}

final class AddCustomerStateLoading extends PosState {}

final class AddCustomerStateSuccess extends PosState {}

final class AddCustomerStateFail extends PosState {}

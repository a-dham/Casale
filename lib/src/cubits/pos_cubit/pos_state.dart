part of 'pos_cubit.dart';

sealed class PosState {}

final class PosInitial extends PosState {}

final class PosStateItemToCart extends PosState {}

final class PosStateRemoveItem extends PosState {}

final class PosStateClearCart extends PosState {}

final class AddCustomerStateLoading extends PosState {}

final class AddCustomerStateSuccess extends PosState {}

final class AddCustomerStateFail extends PosState {}

final class GetCustomerState extends PosState {}

final class GetOrgStateSuccess extends PosState {
  GetOrgStateSuccess({
    required this.orgModel,
  });
  final OrgModel? orgModel;
}

final class GetAccountStateLoading extends PosState {}

final class GetAccountStateSuccess extends PosState {}

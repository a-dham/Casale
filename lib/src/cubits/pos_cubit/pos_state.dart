part of 'pos_cubit.dart';

sealed class PosState {}

final class PosInitial extends PosState {}

final class ItemsSectionsStateLoading extends PosState {}

final class ItemsSectionsStateSuccess extends PosState {}

final class ItemsSectionStateSuccess extends PosState {}

final class ItemsStateLoading extends PosState {}

final class GetItemsSuccess extends PosState {}

final class PosStateItemToCart extends PosState {}

final class TotalOrderStateSuccess extends PosState {}

final class PriceItemStateSuccess extends PosState {}

final class PosStateRemoveItem extends PosState {}

final class PosStateClearCart extends PosState {}

final class AddCustomerStateLoading extends PosState {}

final class AddCustomerStateSuccess extends PosState {}

final class AddCustomerStateFail extends PosState {}

final class GetCustomerState extends PosState {}

final class GetAccountStateLoading extends PosState {}

final class GetAccountStateSuccess extends PosState {}

final class GetOrgDataStateLoading extends PosState {}

final class GetOrgDataStateSuccess extends PosState {}

final class ItemSearchStateloading extends PosState {}

final class ItemSearchStateFail extends PosState {}

final class ItemSearchStateSuccess extends PosState {}

final class CustomerSearchStateloading extends PosState {}

final class CustomerSearchStateSuccess extends PosState {}

final class CustoerIsSearchStateSuccess extends PosState {}

final class UnitSelectStateSuccess extends PosState {}

final class PaymethodsstateInitial extends PosState {}

final class GetPaymethodsstateSuccess extends PosState {}

final class RemainingstateSuccess extends PosState {}

final class InvoiceDataStateLoading extends PosState {}

final class InvoiceDataStateSuccess extends PosState {}

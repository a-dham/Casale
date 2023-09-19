part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class GetPaymethodsstateSuccess extends PaymentState {
  final PaymethodModel? paymethodModel;

  GetPaymethodsstateSuccess({@required this.paymethodModel});
}

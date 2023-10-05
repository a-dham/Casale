// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);

  String sysac = CacheHelper.getData(key: 'sysac');
}

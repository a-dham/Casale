import 'package:bloc/bloc.dart';
import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/domain/models/paymethods_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);

  String sysac = CacheHelper.getData(key: 'sysac');
  double totalInve = 0;

  // get paymethods
  PaymethodModel? paymethodModel;
  getPaymethods() async {
    emit(PaymentInitial());
    await DioHelper.postData(
      url: EndPoints.baseUrl,
      data: {},
      queryParameters: {
        'flr': 'casale/manage/settings/inputoptions/paymethods/views',
        'sysac': sysac,
        'rtype': 'json',
        'dtype': 'json',
      },
    ).then((value) {
      paymethodModel = PaymethodModel.fromJson(value?.data);
      emit(GetPaymethodsstateSuccess(
        paymethodModel: paymethodModel,
      ));
    }).catchError((error) {
      print('error is== $error');
    });
  }

  //
}

// ignore_for_file: avoid_print

import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/domain/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  bool isloading = false;
  login(username, password) async {
    emit(AuthStateLoading());
    isloading = true;
    await DioHelper.postData(url: EndPoints.baseUrl, data: {
      'un': username,
      'up': password,
    }, queryParameters: {
      'flr': 'acc/login',
      'sysac': 'none',
      'rtype': 'json',
      'dtype': 'json',
    }).then((value) async {
      loginModel = LoginModel.fromJson(value?.data);
      if (loginModel.status == 'success') {
        await CacheHelper.saveData(key: 'sysac', value: loginModel.data?.sysac);
        isloading = false;
        emit(AuthStateSuccess(
          loginModel: loginModel,
        ));
      } else if (loginModel.status == 'fail') {
        print('status is fail');
        emit(AuthStateFail());
        isloading = false;
      }
    }).catchError((error) {
      print('Catch Error = $error');
      isloading = false;
      emit(AuthStateFail());
    });
  }
}

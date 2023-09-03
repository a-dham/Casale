// ignore_for_file: avoid_print

import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/domain/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  login(username, password) async {
    emit(AuthStateLoading());
    await DioHelper.postData(
        url: EndPoints.baseUrl,
        data: {},
        queryParameters: {
          'flr': 'acc/login/sysac',
          'sysac': 'this',
          'rtype': 'json',
          'un': username,
          'up': password,
        }).then((value) {
      loginModel = LoginModel.fromJson(value?.data);
      print('model = ${loginModel.data}');
      print('model = ${loginModel.status}');
      if (loginModel.status == 'success') {
        emit(AuthStateSuccess(
          loginModel: loginModel,
        ));
      } else {
        emit(AuthStateFail());
      }
    }).catchError((error) {
      print('Catch Error = $error');
    });
  }
}

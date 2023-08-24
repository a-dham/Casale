import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/domain/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  static ProductsCubit get(context) => BlocProvider.of(context);
  ProductsModel? productsModel;
  getProductData() async {
    //  loading items
    emit(ProductsLoading());
    DioHelper.getData(
      url: EndPoints.baseUrl,
    ).then((value) {
      productsModel = ProductsModel.fromJson(value?.data);
      print(productsModel!.title);
      //  success
      emit(ProductsSuccess());
      // for (var element in productsModel) {}
    }).catchError((error) {
      print(error.toString());
      //  error state
      emit(ProductsError());
    });
  }
}

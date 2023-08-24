class ProductServices {
  // Future<List<ProductsModel>> getAllProducts() async {
  //   // Response response = DioHelper.getData(url: EndPoints.baseUrl);
  // }
}



// http.Response response = await http.get(
//       Uri.parse('$baseUrl/products'),
//     );
//     if (response.statusCode == 200) {
//       return allProductsModelFromJson(response.body);
//     } else {
//       return throw Exception('Fail to Load products ${response.statusCode}');
//     }


// class HomeServices {
//   Future<List<dynamic>> getHomeDataServices() async {
//     try {
//       print('Hola Home Services');
//       Response response = await HomeCubit().getHomeData();
//       print(response.data.toString());
//       return response.data;
//     } catch (error) {
//       print(error.toString());
//       return [];
//     }
//   }
// }
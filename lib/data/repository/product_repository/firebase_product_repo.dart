// ignore_for_file: body_might_complete_normally_catch_error
import 'package:the_exchange_online/data/models/category_model.dart';
import 'package:the_exchange_online/data/models/product_model.dart';
import 'package:the_exchange_online/data/repository/product_repository/product_repo.dart';

class FirebaseProductRepository implements ProductRepository {
  List<ProductModel> products = [];

  /// Get all products
  @override
  Future<List<ProductModel>> fetchProducts() async {
    return [];
  }

  @override
  Future<List<ProductModel>> fetchAuctionProducts() async {
    return [];
  }

  /// Get popular product by soldQuantity
  @override
  Future<List<ProductModel>> fetchCenterPopularProducts() async {
    // const quantity = 10;
    // final queryPredicate = ProductModel.SOLDQUANTITY.ge(quantity);

    // //Get initial result
    // if (!nextResult) {
    //   final firstRequest = ModelQueries.list<StoreModel>(
    //     StoreModel.classType,
    //     limit: 50,
    //     where: queryPredicate,
    //   );
    //   result = await Firebase.API.query(request: firstRequest).response;
    // } else {
    //   //Get next result
    //   if (result?.data!.hasNextResult ?? false) {
    //     result = await Firebase.API
    //         .query(request: result!.data!.requestForNextResult!)
    //         .response;
    //   } else {
    //     return [];
    //   }
    // }

    // if (result!.hasErrors) {
    //   safePrint('errors: ${result!.errors}');
    //   return [];
    // }

    // //Map results to store model
    // products = result!.data!.items.map((data) {
    //   return ProductModel.fromJson(data as Map<String, dynamic>);
    // }).toList();

    // return products;
    return [];
  }

  /// Get discount product by percentOff

  @override
  Future<List<ProductModel>> fetchDiscountProducts() async {
    return [];
  }

  /// Get products by category
  /// [categoryId] is id of category

  @override
  Future<List<ProductModel>> fetchProductsByCategory(String? categoryId) async {
    return [];
  }

  /// Get product by Id
  /// [pid] is product id

  @override
  Future<ProductModel> getProductById(String? pid) async {
    return ProductModel(
      categoryId: "categoryId",
      name: "name",
      description: "description",
      image: ["image"],
      rating: 0,
      quantity: 0,
      soldQuantity: 0,
      originalPrice: 0,
      percentOff: 0,
      isAvailable: false,
      storemodelID: "storemodelID",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override

  /// Update product rating
  /// [pid] is product id
  /// [rating] is updated rating

  Future<void> updateProductRatingById(String pid, double rating) async {}

  /// Get all categories

  @override
  Future<List<CategoryModel>> fetchCenterCategories() async {
    return [];
  }

  /// Get category by id

  @override
  Future<CategoryModel> getCategoryById(String categoryId) async {
    return CategoryModel(
      name: "name",
      imageUrl: "imageUrl",
      storemodelID: "storemodelID",
    );
  }

  ///Singleton factory
  static final FirebaseProductRepository _instance =
      FirebaseProductRepository._internal();

  factory FirebaseProductRepository() {
    return _instance;
  }

  FirebaseProductRepository._internal();
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';
import 'package:the_exchange_online/data/repository/store_repository/shop_repo.dart';

class FirebaseShopRepository implements ShopRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Stream<ShopModel?> fetchShop(String uid) {
    try {
      return _firestore
          .collection("shops")
          .where('id', isEqualTo: uid)
          .limit(1)
          .snapshots()
          .map((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          return ShopModel.fromMap(snapshot.docs.first.data());
        } else {
          debugPrint("No shop found for user: $uid");
          return null;
        }
      });
    } catch (error) {
      debugPrint("Error fetching stores: $error");
      return const Stream.empty();
    }
  }

  @override
  Future<List<ShopModel>?> fetchProducts() async {
    // try {
    //   const storeActivity = true;
    //   final queryPredicate = StoreModel.ISACTIVE.eq(storeActivity);

    //   //Get initial result
    //   if (!nextResult) {
    //     final firstRequest = ModelQueries.list<StoreModel>(
    //       StoreModel.classType,
    //       limit: 50,
    //       where: queryPredicate,
    //     );
    //     result = await Firebase.API.query(request: firstRequest).response;
    //   } else {
    //     //Get next result
    //     if (result?.data!.hasNextResult ?? false) {
    //       result = await Firebase.API
    //           .query(request: result!.data!.requestForNextResult!)
    //           .response;
    //     } else {
    //       return [];
    //     }
    //   }

    //   if (result!.hasErrors) {
    //     safePrint('errors: ${result!.errors}');
    //     return [];
    //   }

    //   //Map results to store model
    //   stores = result!.data?.items.map((data) {
    //     return StoreModel.fromJson(data!.toJson());
    //   }).toList();

    //   if (stores == null) {
    //     safePrint('No stores found');
    //     return [];
    //   }

    //   return stores;
    // } on ApiException catch (e) {
    //   safePrint('Query failed: $e');
    //   return [];
    // }
    return [];
  }
}

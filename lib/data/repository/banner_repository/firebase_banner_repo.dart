import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_exchange_online/data/models/banner_model.dart';
import 'package:the_exchange_online/data/repository/banner_repository/banner_repo.dart';

/// Cart is collection in each user
class FirebaseBannerRepository implements BannerRepository {
  final _center = FirebaseFirestore.instance;

  @override
  Future<List<BannerModel>> fetchCenterBanners() async {
    List<BannerModel> banners = [];
    try {
      QuerySnapshot snapshot = await _center.collection("banners").get();

      banners = snapshot.docs.map((doc) {
        return BannerModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint("Error fetching banners: $error");
    }
    return banners;
  }

  Future<String> getDownloadUrl(String key) async {
    // try {
    //   final result = await Firebase.Storage.getUrl(
    //     path: StoragePath.fromString(key),
    //     options: const StorageGetUrlOptions(
    //       pluginOptions: S3GetUrlPluginOptions(
    //         validateObjectExistence: true,
    //         expiresIn: Duration(days: 1),
    //       ),
    //     ),
    //   ).result;
    //   return result.url.toString();
    // } on StorageException catch (e) {
    //   safePrint(e.message);
    //   return "";
    // }
    return "";
  }

  @override
  Future<List<BannerModel>> fetchBanners() async {
    // StorageListResult<StorageItem> result;

    // try {
    //   String? nextToken;
    //   bool hasNextPage;
    //   do {
    //     //Retrieve each banner from s3
    //     result = await Firebase.Storage.list(
    //       path: const StoragePath.fromString("public/home-banners/"),
    //       options: StorageListOptions(
    //         pageSize: 100,
    //         nextToken: nextToken,
    //         pluginOptions: const S3ListPluginOptions(
    //           excludeSubPaths: true,
    //           delimiter: '/',
    //         ),
    //       ),
    //     ).result;
    //     nextToken = result.nextToken;
    //     hasNextPage = result.hasNextPage;
    //   } while (hasNextPage);

    //   // Map result to banner model
    //   return result.items
    //       .map((item) => BannerModel(imageUrl: item.path))
    //       .toList();
    // } on StorageException catch (error) {
    //   safePrint("Storage Exception: ${error.message}");
    //   return [];
    // }
    return [];
  }

  ///Singleton factory
  static final FirebaseBannerRepository _instance =
      FirebaseBannerRepository._internal();

  factory FirebaseBannerRepository() {
    return _instance;
  }

  FirebaseBannerRepository._internal();
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mypoll/Home_screen/model_class/banner_data.dart';
import 'package:mypoll/Home_screen/model_class/categories_model.dart';

class HomeScreenController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late List<BannerDataModel> bannerData;
  late List<CategoriesModal> categoriesData;
  late List<CategoriesModal> featuredData;
  @override
  void onInit() {
    super.onInit();
    getAllData();
  }

  void getAllData() async {
    await Future.wait([
      getBannerData(),
      getAllCategories(),
      getAllFeatured(),
    ]).then((value) {
      print("data");
      print(bannerData[0].image);
      print(categoriesData[0].id);
      print(featuredData[0].id);
    });
  }

  Future<void> getBannerData() async {
    await _firestore.collection('banner').get().then((value) {
      bannerData =
          value.docs.map((e) => BannerDataModel.fromJson(e.data())).toList();
    });
  }

  Future<void> getAllCategories() async {
    await _firestore.collection('categories').get().then((value) {
      categoriesData =
          value.docs.map((e) => CategoriesModal.fromJson(e.data())).toList();
    });
  }

  Future<void> getAllFeatured() async {
    await _firestore.collection('featured').get().then((value) {
      featuredData =
          value.docs.map((e) => CategoriesModal.fromJson(e.data())).toList();
    });
  }
}

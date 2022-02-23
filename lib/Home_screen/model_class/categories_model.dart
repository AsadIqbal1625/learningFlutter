class CategoriesModal {
  late String id, image, title;
  CategoriesModal({required this.id, required this.image, required this.title});
  CategoriesModal.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    image = map['img'];
    title = map['title'];
  }
}

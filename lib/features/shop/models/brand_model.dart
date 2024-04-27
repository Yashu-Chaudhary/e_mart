

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productsCount,
  });

  // Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  // Convert Model to Json structure so that you can store data in Firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  // Map json oriented document snapshot froom Firebase to User Model
  factory BrandModel.fromJsom(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      image: data['Image'] ?? '',
      name: data['Name'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
    );
  }

  // Map json oriented document snapshot form firevase to usermodel
  // factory BrandModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;

  //     // Map JSON Record to the Model
  //     return BrandModel(
  //       id: document.id,
  //       image: data['Image'] ?? '',
  //       name: data['Name'] ?? '',
  //     );
  //   }
  // }
}

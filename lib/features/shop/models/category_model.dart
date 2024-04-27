
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.isFeatured,
    required this.image,
    this.parentId = '',
  });

  // Empty Helper Function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', isFeatured: false, image: '');

  // convert model to Json structure so tat uou can store data in firdbase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  // map json oriented document snapshot form Firevase to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return CategoryModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          parentId: data['ParentId'] ?? '',
          isFeatured: data['IsFeatured'] ?? false);
    } else {
      return CategoryModel.empty();
    }
  }
}

import 'package:edushalaacademy/models/sub_catagory.dart';

class CategoryResponse {
  final bool isError;
  final int? parentId;
  final String message;
  final List<SubCategory> data;

  CategoryResponse({
    required this.isError,
    this.parentId,
    required this.message,
    required this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    List<SubCategory> subCategories = List<SubCategory>.from(
      json['data'].map((item) => SubCategory.fromJson(item)),
    );

    return CategoryResponse(
      isError: json['is_error'],
      parentId: json['parentid'],
      message: json['message'],
      data: subCategories,
    );
  }
}

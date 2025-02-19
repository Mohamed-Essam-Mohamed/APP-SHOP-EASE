class AllCategoryResponse {
  AllCategoryData? data;

  AllCategoryResponse({this.data});

  AllCategoryResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? AllCategoryData.fromJson(json['data']) : null;
  }
}

class AllCategoryData {
  List<CategoriesData>? categories;

  AllCategoryData({this.categories});

  AllCategoryData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <CategoriesData>[];
      json['categories'].forEach((v) {
        categories!.add(CategoriesData.fromJson(v));
      });
    }
  }
}

class CategoriesData {
  String? name;
  String? id;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoriesData(
      {this.name, this.id, this.image, this.creationAt, this.updatedAt});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
}

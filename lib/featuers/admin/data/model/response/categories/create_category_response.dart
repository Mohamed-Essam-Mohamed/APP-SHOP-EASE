class CreateCategoryResponse {
  CreateCategoryData? data;

  CreateCategoryResponse({this.data});

  CreateCategoryResponse.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? CreateCategoryData.fromJson(json['data']) : null;
  }
}

class CreateCategoryData {
  AddCategory? addCategory;

  CreateCategoryData({this.addCategory});

  CreateCategoryData.fromJson(Map<String, dynamic> json) {
    addCategory = json['addCategory'] != null
        ? AddCategory.fromJson(json['addCategory'])
        : null;
  }
}

class AddCategory {
  String? id;
  String? name;
  String? image;

  AddCategory({this.id, this.name, this.image});

  AddCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}

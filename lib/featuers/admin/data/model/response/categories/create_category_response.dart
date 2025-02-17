class CreateCategoryResponse {
  Data? data;

  CreateCategoryResponse({this.data});

  CreateCategoryResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  AddCategory? addCategory;

  Data({this.addCategory});

  Data.fromJson(Map<String, dynamic> json) {
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

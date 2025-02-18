class DeleteCategoryResponse {
  DeleteCategoryData? data;

  DeleteCategoryResponse({this.data});

  DeleteCategoryResponse.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? DeleteCategoryData.fromJson(json['data']) : null;
  }
}

class DeleteCategoryData {
  bool? deleteCategory;

  DeleteCategoryData({this.deleteCategory});

  DeleteCategoryData.fromJson(Map<String, dynamic> json) {
    deleteCategory = json['deleteCategory'];
  }
}

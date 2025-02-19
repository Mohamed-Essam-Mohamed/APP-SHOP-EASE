class UpdateCategoryResponse {
  String? id;
  UpdateCategoryResponse({this.id});

  UpdateCategoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['data']["updateCategory"]["id"];
  }
}

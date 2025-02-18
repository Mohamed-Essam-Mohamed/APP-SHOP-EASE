import 'package:app_shop_ease/featuers/admin/data/model/request/categories/create_category_request.dart';

class CategoryQueries {
  Map<String, dynamic> getAllCategoriesQuery() {
    return {
      'query': r'''
        {
          categories{
            name
            id
            image
            creationAt
            updatedAt
          }
        }
       ''',
    };
  }

  Map<String, dynamic> createCategoryQuery(CreateCategoryRequest request) {
    return {
      'query': r'''
       mutation Create($name: String!, $image: String!) {
          addCategory(
            data: { name: $name, image: $image }
          ) {
            id
            name
            image
          }
        }
      ''',
      'variables': {
        'name': request.name,
        'image': request.image,
      },
    };
  }

  Map<String, dynamic> deleteCategoryQuery({required String id}) {
    return {
      'query': r'''
        mutation Delete($id: ID!) {
          deleteCategory(id: $id)
        }
      ''',
      'variables': {
        'id': id,
      },
    };
  }
}

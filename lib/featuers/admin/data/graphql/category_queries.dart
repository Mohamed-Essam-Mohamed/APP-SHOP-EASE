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
}

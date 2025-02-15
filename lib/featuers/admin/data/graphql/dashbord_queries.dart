class DashboardQueries {
  //? products
  Map<String, dynamic> productsQuery() {
    return {
      'query': r'''
          {
            products{
              title
            }
          }
      ''',
    };
  }

  //? categories
  Map<String, dynamic> categoriesQuery() {
    return {
      'query': r'''
       {
        categories{
          name
         }
       }
      ''',
    };
  }

  //? users
  Map<String, dynamic> usersQuery() {
    return {
      'query': r'''
       {
          users{
            name
          }
      }
      ''',
    };
  }
}

part of 'dashboard_cubit.dart';

enum RequestStatus { loading, success, failure, initial }

extension RequestStatusX on DashboardState {
  bool get isProductLoading => productState == RequestStatus.loading;
  bool get isProductSuccess => productState == RequestStatus.success;
  bool get isProductFailure => productState == RequestStatus.failure;
  bool get isProductInitial => productState == RequestStatus.initial;

  bool get isCategoryLoading => categoryState == RequestStatus.loading;
  bool get isCategorySuccess => categoryState == RequestStatus.success;
  bool get isCategoryFailure => categoryState == RequestStatus.failure;
  bool get isCategoryInitial => categoryState == RequestStatus.initial;

  bool get isUserLoading => userState == RequestStatus.loading;
  bool get isUserSuccess => userState == RequestStatus.success;
  bool get isUserFailure => userState == RequestStatus.failure;
  bool get isUserInitial => userState == RequestStatus.initial;
}

@immutable
class DashboardState extends Equatable {
  final int productCount;
  final String errorProduct;
  final RequestStatus productState;

  final int categoryCount;
  final String errorCategory;
  final RequestStatus categoryState;

  final int userCount;
  final String errorUser;
  final RequestStatus userState;

  const DashboardState({
    this.productCount = 0,
    this.errorProduct = '',
    this.productState = RequestStatus.initial,
    this.categoryCount = 0,
    this.errorCategory = '',
    this.categoryState = RequestStatus.initial,
    this.userCount = 0,
    this.errorUser = '',
    this.userState = RequestStatus.initial,
  });
  @override
  List<Object> get props => [
        productCount,
        errorProduct,
        productState,
        categoryCount,
        errorCategory,
        categoryState,
        userCount,
        errorUser,
        userState
      ];

  DashboardState copyWith({
    int? productCount,
    String? errorProduct,
    RequestStatus? productState,
    int? categoryCount,
    String? errorCategory,
    RequestStatus? categoryState,
    int? userCount,
    String? errorUser,
    RequestStatus? userState,
  }) {
    return DashboardState(
      productCount: productCount ?? this.productCount,
      errorProduct: errorProduct ?? this.errorProduct,
      productState: productState ?? this.productState,
      categoryCount: categoryCount ?? this.categoryCount,
      errorCategory: errorCategory ?? this.errorCategory,
      categoryState: categoryState ?? this.categoryState,
      userCount: userCount ?? this.userCount,
      errorUser: errorUser ?? this.errorUser,
      userState: userState ?? this.userState,
    );
  }
}

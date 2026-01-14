import 'package:ecommerce_clothing/core/routes/app_paths.dart';
import 'package:ecommerce_clothing/data/models/product_model.dart';
import 'package:ecommerce_clothing/presentation/pages/checkout/checkout_page.dart';
import 'package:ecommerce_clothing/presentation/pages/details/details_page.dart';
import 'package:ecommerce_clothing/presentation/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppPaths.home,
    routes: [
      GoRoute(
        path: AppPaths.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppPaths.details,
        builder: (context, state) => DetailsPage(product: state.extra as ProductModel),
      ),
      GoRoute(
        path: AppPaths.checkout,
        builder: (context, state) => const CheckoutPage(),
      ),
    ],
  );
}

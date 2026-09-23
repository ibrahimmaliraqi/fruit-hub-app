import 'package:fruit_hub_app/features/auth/presentation/view/login_view.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:fruit_hub_app/features/best_selling/presentation/view/best_selling_view.dart';
import 'package:fruit_hub_app/features/home/presentation/view/home_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final String loginView = '/login';
  static final String signUpView = '/sign-up';
  static final String homeView = '/home';
  static final String bestSellingView = '/bestSellingView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: signUpView,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: bestSellingView,
        builder: (context, state) => BestSellingView(),
      ),
    ],
  );
}

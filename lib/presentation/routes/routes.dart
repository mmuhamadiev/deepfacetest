import 'package:deepface_test/presentation/pages/database/view/database_page.dart';
import 'package:deepface_test/presentation/pages/main/view/main_page.dart';
import 'package:deepface_test/presentation/pages/splash/view/splash_page.dart';
import 'package:deepface_test/presentation/pages/video/view/video_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: '/',
    path: '/',
    builder: (context, state) => const SplashPage(),
  ),
  GoRoute(
    name: '/main',
    path: '/main',
    builder: (context, state) => const MainPage(),
    routes: [
      GoRoute(
        name: 'video',
        path: 'video',
        builder: (context, state) => const VideoPage(),
      ),
      GoRoute(
        name: 'database',
        path: 'database',
        builder: (context, state) => const DatabasePage(),
      ),
    ]
  ),
  // GoRoute(
  //   name: '/product_details',
  //   path: '/product_details/:productId',
  //   builder: (context, state) => ProductDetailPage(
  //       productIndex: int.parse(state.pathParameters['productId'].toString())
  //   ),
  // ),
  // GoRoute(
  //   name: '/address',
  //   path: '/address',
  //   builder: (context, state) => const MyAddressPage(),
  //   routes: [
  //     GoRoute(
  //       name: 'add',
  //       path: 'add',
  //       builder: (context, state) => const AddLocationPage(),
  //     ),
  //   ]
  // ),
  // GoRoute(
  //   name: '/orderDetail',
  //   path: '/orderDetail:deliveryIndex',
  //   builder: (context, state) => OrderDetailPage(
  //     deliveryIndex: int.parse(state.pathParameters['deliveryIndex']?? '0'),
  //   ),
  // ),
  // GoRoute(
  //     name: '/user_test_result',
  //     path: '/user_test_result/:userID/:resultID',
  //     builder: (context, state) => UserAnalizTestView(userID: state.pathParameters['userID']?? '', resultID: state.pathParameters['resultID']?? '')
  // ),

]
);

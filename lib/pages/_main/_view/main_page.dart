import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:template/app/router/app_router.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
        routes: const [HomeRoute(), SearchRoute(), LibraryRoute()],
        appBarBuilder: (_, __) => AppBar(
          title: const Text(
            'eDD',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 36,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        transitionBuilder: (context, child, animation) =>
            FadeTransition(opacity: animation, child: child),
        bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Library',
              icon: Icon(Icons.library_books),
            ),
          ],
        ),
      );
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:template/app/router/app_router.dart';

@RoutePage()
class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsRouter.tabBar(
        homeIndex: 0,
        routes: const [ShelvesRoute(), InventoryRoute(), FavoritesRoute()],
        builder: (context, child, controller) => DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: TabBar(
                controller: controller,
                tabs: const [
                  Tab(text: 'Shelves', icon: Icon(Icons.abc)),
                  Tab(text: 'Inventory', icon: Icon(Icons.abc)),
                  Tab(text: 'Favorites', icon: Icon(Icons.abc)),
                ],
                // router: context.router,
              ),
            ),
            body: child,
          ),
        ),
      );
}

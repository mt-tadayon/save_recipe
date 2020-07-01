import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/provider/app_provider.dart';
import 'package:saverecipe/screen/add_recipe_screen.dart';
import 'package:saverecipe/screen/category_screen.dart';
import 'package:saverecipe/utils/responsive_layout.dart';
import 'package:saverecipe/widgets/custom_app_bar.dart';
import 'package:saverecipe/widgets/lazy_network_image.dart';
import 'package:saverecipe/widgets/wave_border_card.dart';

class DashboardScreen extends StatelessWidget {
  Widget heightPlaceholder(bool isMobileScreen) => SizedBox(
        height: isMobileScreen ? 20.0 : 30.0,
      );

  @override
  Widget build(BuildContext context) {
    var isMobileScreen = ResponsiveLayout.isSmallScreen(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            backgroundColor: Colors.transparent,
            expandedHeight: 300.0,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: LazyNetworkImage(
                      imageUrl: 'https://loremflickr.com/300/300/food'),
                ),
                Align(
                  child: CustomAppBar(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ChangeNotifierProvider<AppProvider>(
                                  create: (context) => AppProvider(),
                                  child: AddRecipeScreen(),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add_circle,
                            size: 48,
                          ),
                        ),
                      )
                    ],
                  ),
                  alignment: Alignment.topCenter,
                )
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: isMobileScreen ? 40.0 : 50.0,
              horizontal: isMobileScreen ? 20.0 : 30.0,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  'Recipe of the day',
                  style: Theme.of(context).textTheme.headline5,
                ),
                heightPlaceholder(isMobileScreen),
                WaveBorderCard(
                  recipeCardName: "Pancake",
                ),
                heightPlaceholder(isMobileScreen),
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.headline5,
                ),
                heightPlaceholder(isMobileScreen),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: Consumer<AppProvider>(
                    builder: (context, appProvider, child) {
                      return ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                          child: WaveBorderCard(
                            recipeCardName: appProvider.categories[index].name,
                            width: 200,
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animationOne, animationTwo) =>
                                        CategoryScreen(
                                  categoryName:
                                      appProvider.categories[index].name,
                                ),
                                transitionsBuilder: (context, animationOne,
                                    animationTwo, child) {
                                  var begin = Offset(0.0, 1.0);
                                  var end = Offset.zero;
                                  var curve = Curves.ease;

                                  var tween =
                                      Tween(begin: begin, end: end).chain(
                                    CurveTween(curve: curve),
                                  );

                                  return SlideTransition(
                                    position: animationOne.drive(tween),
                                    child: child,
                                  );
                                },
                                transitionDuration: Duration(seconds: 3),
                              ),
                            );
                          },
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20.0),
                        itemCount: appProvider.categories.length,
                        scrollDirection: Axis.horizontal,
                      );
                    },
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}

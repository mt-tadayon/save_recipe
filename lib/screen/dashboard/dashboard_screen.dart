import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/provider/app_provider.dart';
import 'package:saverecipe/screen/add_recipe_screen.dart';
import 'package:saverecipe/screen/dashboard/category_list.dart';
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
                CategoryList()
              ]),
            ),
          )
        ],
      ),
    );
  }
}

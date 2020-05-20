import 'package:flutter/material.dart';
import 'package:saverecipe/utils/responsive_layout.dart';
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
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage('https://loremflickr.com/300/300/food'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: isMobileScreen ? 40.0 : 50.0,
              bottom: isMobileScreen ? 40.0 : 50.0,
              left: isMobileScreen ? 20.0 : 30.0,
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
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        WaveBorderCard(recipeCardName: "Real Data", width: 200),
                    separatorBuilder: (context, index) => SizedBox(width: 20.0),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
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

import 'package:flutter/material.dart';
import 'package:saverecipe/utils/responsive_layout.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isMobileScreen = ResponsiveLayout.isSmallScreen(context);

    const imageUrlRecipeOfDay = 'https://loremflickr.com/200/400/food';

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
            padding: EdgeInsets.symmetric(
                vertical: isMobileScreen ? 40.0 : 50.0,
                horizontal: isMobileScreen ? 20.0 : 40.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  'Recipe of the day',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: isMobileScreen ? 20.0 : 30.0,
                ),
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: 200.0,
                      width: 400.0,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(imageUrlRecipeOfDay),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x66000000),
                                offset: Offset(3, 3),
                                blurRadius: 6.0)
                          ]),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: isMobileScreen ? 10 : 30),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding:
                            EdgeInsets.only(left: isMobileScreen ? 10.0 : 20.0),
                        height: isMobileScreen ? 40 : 200,
                        width: isMobileScreen ? 300 : 500,
                        decoration: BoxDecoration(
                          color: const Color(0xCCFFFFFF),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Text('Pancakes', style: TextStyle(fontSize: 20.0),),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}

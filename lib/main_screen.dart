import 'package:flutter/material.dart';
import 'package:tec/fack_data.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_string.dart';
import 'package:tec/models_main/basic_data.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.menu),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 70,
                    width: 90,
                  ),
                  Icon(Icons.search),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              //------------------STACK--------------------//
              Stack(
                children: [
                  Container(
                    width: size.width / 1.20,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/skynews.jpg" /*homePagePosterMap["imageAsset"]*/),
                            fit: BoxFit.cover)),
                    foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                            colors: gradiantColrs.posterCoverGradiant,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 8,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                homePagePosterMap["writer"] +
                                    " - " +
                                    homePagePosterMap["data"],
                                style: theme.subtitle1),
                            Row(
                              children: [
                                Text(homePagePosterMap["view"],
                                    style: theme.subtitle1),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.remove_red_eye_sharp,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(homePagePosterMap["title"],
                            style: theme.headline1),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              //------------------------the list view after Stack
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tagList.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 8, index == 0 ? bodyMargin : 15, 8),
                        child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              gradient: LinearGradient(
                                  colors: gradiantColrs.tags,
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/hashtagicon.png",
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    tagList[index].title,
                                    style: theme.headline2,
                                  )
                                ],
                              ),
                            )),
                      );
                    })),
              ),

              SizedBox(height: 30, width: 30),
              Padding(
                  padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        /* Image.asset(
                        'assets/images/blue_pen.png',*/
                        color: solidColors.colorTitle_blue,
                      ),
                      Text(
                        myString.viewHotestBlog,
                        style: theme.bodyText1,
                      )
                    ],
                  )),
              SizedBox(
                height: size.height / 3.1,
                child: ListView.builder(
                    itemCount: blogList.getRange(0, 5).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: index == 0 ? bodyMargin : 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height / 4.30,
                              width: size.width / 2.5,
                              child: Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          blogList[index].imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  foregroundDecoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      gradient: LinearGradient(
                                          colors: gradiantColrs.blog,
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter)),
                                ),

                                //////-------- the position of write in the Container---////
                                Positioned(
                                  left: 4,
                                  right: 4,
                                  bottom: 8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        blogList[index].writer,
                                        style: theme.subtitle1,
                                      ),
                                      Row(children: [
                                        Text(blogList[index].views,
                                            style: theme.subtitle1),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ])
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                                width: size.width / 2.5,
                                child: Text(
                                  blogList[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ))
                          ],
                        ),
                      );
                    }),
              ),
              /////////////////////////////////////////////////////////////////////////////////////////
              Row()
            ],
          ),
        ),
      ),
    );
  }
}

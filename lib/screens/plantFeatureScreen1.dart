import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantshop/components/TopAppBar.dart';
import 'package:plantshop/constants.dart';
import 'package:plantshop/listData/lists.dart';
import 'package:plantshop/modelClass/viewTotalItem.dart';
import 'package:plantshop/screens/particularPlant2.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

Route createRoute(int j) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ParticularPlant2(indexNumber: j),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(3.0, 3.0);
      var end = Offset.zero;
      var curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

OurAllLists ourAllLists = OurAllLists();

class PlantFeatureScreen1 extends StatefulWidget {
  @override
  _PlantFeatureScreen1State createState() => _PlantFeatureScreen1State();
}

class _PlantFeatureScreen1State extends State<PlantFeatureScreen1> {
  tabMaker() {
    List<Tab> tabs = List();
    for (var i = 0; i < ourAllLists.tabsText.length; i++) {
      tabs.add(Tab(
        text: ourAllLists.tabsText[i],
      ));
    }
    return tabs;
  }

  //this is tabviewer maker
  tabViewerMaker(BuildContext context) {
    List<ListView> tabBarView = List();
    for (var i = 0; i < ourAllLists.tabsText.length; i++) {
      tabBarView.add(
        ListView(
            scrollDirection: Axis.horizontal,
            children: containerAdder(i, Colors.blue, context)),
      );
    }
    return tabBarView;
  }

//this is for adding container to the listview
  containerAdder(initialI, Color initialContainerColor, BuildContext context) {
    List<Widget> listViewContainer = List();
    for (var j = 0; j < ourAllLists.mainListAllPlantDetailsList1.length; j++) {
      if (ourAllLists.tabsText[initialI] ==
          ourAllLists.mainListAllPlantDetailsList1[j].ca) {
        listViewContainer.add(VisibilityDetector(
          key: Key(j.toString()),
          onVisibilityChanged: (visibilityInfo) {
            print(j.toString() +
                " is " +
                visibilityInfo.visibleFraction.toString());
            if (visibilityInfo.visibleFraction > 0.75) {
              viewTotalItemProvider.activeIndex = j;
            }
          },
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(createRoute(j));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
              child: Container(
                  height: 350,
                  width: 250,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom:
                            viewTotalItemProvider.activeIndex == j ? 10 : 20,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: viewTotalItemProvider.activeIndex == j
                              ? EdgeInsets.fromLTRB(25, 50, 20, 20)
                              : EdgeInsets.fromLTRB(25, 50, 20, 0),
                          height: viewTotalItemProvider.activeIndex == j
                              ? 165
                              : 145,
                          width: 225,
                          decoration: BoxDecoration(
                            color: viewTotalItemProvider.activeIndex == j
                                ? Color(0xFF96CA2D)
                                : Color(0xFFCAE495),
                            borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(80),
                              topEnd: Radius.circular(80),
                              topStart: Radius.circular(80),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ourAllLists.mainListAllPlantDetailsList1[j].ca,
                                style: TextStyle(
                                    color: Color(0xFFCc8E392), fontSize: 15),
                              ),
                              Text(
                                ourAllLists.mainListAllPlantDetailsList1[j].pN,
                                style: TextStyle(
                                    color: Color(0xFFEAF4D5), fontSize: 25),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '\$ ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ourAllLists
                                            .mainListAllPlantDetailsList1[j].pr
                                            .toString(),
                                        style: kItemPriceFirstAndSecondScreen),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 35,
                        child: Container(
                            height: 210,
                            child: Image(
                                image: AssetImage(ourAllLists
                                    .mainListAllPlantDetailsList1[j].pI))),
                      )
                    ],
                  )),
            ),
          ),
        ));
      } else {
        continue;
      }
    }
    return listViewContainer;
  }

//for calculating the total no. of items.

  colorAndSizeChanger(double visiblePercentage) {
    if (visiblePercentage == 100) {
      print("widget  is 100% visible with  color");
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  ViewTotalItemProvider viewTotalItemProvider;
  @override
  Widget build(BuildContext context) {
    viewTotalItemProvider =
        Provider.of<ViewTotalItemProvider>(context, listen: false);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: <Widget>[
              Padding(
                padding: kMainPadding,
                child: TopAppBar(
                  appBarIcon: FontAwesomeIcons.search,
                  onPressedFunction: () {
                    Navigator.of(context).push(createRouteAddToCart());
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment(-1, 1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: kMainPadding,
                      child: Text(
                        "Plants",
                        style: kScreenHeading,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: DefaultTabController(
                    length: 5,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: TabBar(
                            labelColor: Color(0xFF96CA2D),
                            unselectedLabelColor: Colors.grey,
                            unselectedLabelStyle:TextStyle(fontWeight:FontWeight.w400) ,
                            labelStyle:
                                TextStyle(fontSize: 20, fontFamily: "Lato",fontWeight: FontWeight.w700),
                            indicator: CircleTabIndicator(color: Color(0xFF96CA2D), radius: 4),
                            isScrollable: true,
                            tabs: tabMaker(),
                          ),
                        ),
                        Consumer<ViewTotalItemProvider>(
                            builder: (context, value, child) {
                          return Container(
                            height: 355,
                            width: double.infinity,
                            decoration: BoxDecoration(color: Colors.white),
                            child: TabBarView(
                              children: tabViewerMaker(context),
                            ),
                          );
                        }),
                        Padding(
                          padding: kMainPadding,
                          child: Container(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                      child: Text("Description",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Lato")),
                                    ),
                                    Icon(FontAwesomeIcons.plus,
                                        size: 18, color: Color(0xFFA0A5A8))
                                  ],
                                ),
                                Consumer<ViewTotalItemProvider>(
                                  builder: (context, value, child) {
                                    return Text(
                                      ourAllLists
                                          .mainListAllPlantDetailsList1[
                                              viewTotalItemProvider.activeIndex]
                                          .des,
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: "Poppins"),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: kMainPadding,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(createRouteAddToCart());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      width: double.infinity,
                      child: Stack(
                        overflow: Overflow.visible,
                        children: [
                          Container(
                            height: 70,
                            width: 115,
                            decoration: BoxDecoration(
                                color: Color(0xFF96CA2D),
                                borderRadius:
                                    BorderRadiusDirectional.horizontal(
                                        end: Radius.circular(32),
                                        start: Radius.circular(32))),
                            child: Icon(FontAwesomeIcons.shoppingBag,
                                color: Colors.white, size: 30),
                          ),
                          Positioned(
                            // top: 0,
                            bottom: 50,
                            right: 0,
                            child: Consumer<ViewTotalItemProvider>(
                                builder: (context, value, child) {
                              return Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Color(0xFF96CA2D), width: 4)),
                                child: Center(
                                    child: Text(
                                        viewTotalItemProvider
                                            .totalquantity()
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF96CA2D)))),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius}) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

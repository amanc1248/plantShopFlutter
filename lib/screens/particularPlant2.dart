import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantshop/components/TopAppBar.dart';
import 'package:plantshop/listData/listClasses.dart';
import 'package:plantshop/listData/lists.dart';
import 'package:plantshop/modelClass/viewTotalItem.dart';
import 'package:plantshop/screens/cartScreen.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

OurAllLists ourAllLists = OurAllLists();
// ViewTotalItemProvider viewTotalItemProvider = ViewTotalItemProvider();

class ParticularPlant2 extends StatefulWidget {
  final indexNumber;
  ParticularPlant2({@required this.indexNumber});
  @override
  _ParticularPlant2State createState() => _ParticularPlant2State();
}

class _ParticularPlant2State extends State<ParticularPlant2> {
  @override
  Widget build(BuildContext context) {
    final ViewTotalItemProvider viewTotalItemProvider =
        Provider.of<ViewTotalItemProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF96CA2D),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(60))),
              child: Padding(
                padding: kMainPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopAppBar(
                      onPressedFunction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartDetais3()),
                        );
                      },
                      appBarIcon: FontAwesomeIcons.shoppingBag,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      ourAllLists
                          .mainListAllPlantDetailsList1[widget.indexNumber].pN,
                      style: kPlantNameStyle,
                    ),
                    Text(
                      ourAllLists
                          .mainListAllPlantDetailsList1[widget.indexNumber].ca
                          .toUpperCase(),
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        text: '\$ ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF96CA2D)),
                        children: <TextSpan>[
                          TextSpan(
                              text: ourAllLists
                                  .mainListAllPlantDetailsList1[
                                      widget.indexNumber]
                                  .pr
                                  .toString(),
                              style: kItemPrice),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 330,
                        // color:Colors.amber,
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 40,
                                child: Container(
                                  // color:Colors.redAccent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 170,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Icon(
                                                FontAwesomeIcons.flag,
                                                color: Color(0xFF9DCD3C),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            FlatButton(
                                                onPressed: () {
                                                  final tile = viewTotalItemProvider
                                                      .cartPlantList3
                                                      .firstWhere(
                                                          (item) =>
                                                              item.pN ==
                                                              ourAllLists
                                                                  .mainListAllPlantDetailsList1[
                                                                      widget
                                                                          .indexNumber]
                                                                  .pN,
                                                          orElse: () => null);
                                                  if (tile != null) {
                                                  } else {
                                                    viewTotalItemProvider
                                                        .addItems(
                                                      CartPlantLists(
                                                        quantity: 1,
                                                        plantName: ourAllLists
                                                            .mainListAllPlantDetailsList1[
                                                                widget
                                                                    .indexNumber]
                                                            .pN,
                                                        category: ourAllLists
                                                            .mainListAllPlantDetailsList1[
                                                                widget
                                                                    .indexNumber]
                                                            .ca,
                                                        price: ourAllLists
                                                            .mainListAllPlantDetailsList1[
                                                                widget
                                                                    .indexNumber]
                                                            .pr,
                                                      ),
                                                    );
                                                  }

                                                  print(viewTotalItemProvider
                                                      .cartPlantList3.length);
                                                },
                                                child: Stack(
                                                  children: [
                                                    Consumer<
                                                        ViewTotalItemProvider>(
                                                      builder: (context, value,
                                                          child) {
                                                        return Container(
                                                            height: 80,
                                                            width: 80,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF9DCD3C),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50)),
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                    top: 25,
                                                                    left: 28,
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .shoppingBag,
                                                                        color: Colors
                                                                            .white)),
                                                                Positioned(
                                                                    top: 16,
                                                                    left: 55,
                                                                    child: Text(
                                                                      viewTotalItemProvider
                                                                          .particularItemCalculation(
                                                                              widget.indexNumber)
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          color:
                                                                              Colors.white),
                                                                    ))
                                                              ],
                                                            ));
                                                      },
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 255,
                                        child: Image(
                                            image: AssetImage(ourAllLists
                                                .mainListAllPlantDetailsList1[
                                                    widget.indexNumber]
                                                .pI)),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFF96CA2D)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SuWaTemp(
                    iconDetails: FontAwesomeIcons.lightbulb,
                    iconColor: Colors.yellowAccent,
                    typeDetail: ourAllLists
                        .mainListAllPlantDetailsList1[widget.indexNumber].li,
                    typeHeading: "Light",
                  ),
                  SuWaTemp(
                    iconDetails: FontAwesomeIcons.dropbox,
                    iconColor: Colors.blueAccent,
                    typeDetail: ourAllLists
                        .mainListAllPlantDetailsList1[widget.indexNumber].wa,
                    typeHeading: "Water",
                  ),
                  SuWaTemp(
                    iconDetails: FontAwesomeIcons.thermometer,
                    iconColor: Colors.brown,
                    typeDetail: ourAllLists
                        .mainListAllPlantDetailsList1[widget.indexNumber].temp,
                    typeHeading: "Temper",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SuWaTemp extends StatelessWidget {
  final IconData iconDetails;
  final String typeDetail;
  final String typeHeading;
  final Color iconColor;
  SuWaTemp(
      {this.iconDetails, this.typeDetail, this.typeHeading, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 168,
        width: 105,
        decoration: BoxDecoration(
          color: Color(0xFF84B42C),
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(50),
            topStart: Radius.circular(50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                height: 80,
                width: 80,
                child: Icon(iconDetails, color: iconColor, size: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 6),
              child: Text(
                typeDetail,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                typeHeading,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
              ),
            ),
          ],
        ));
  }
}

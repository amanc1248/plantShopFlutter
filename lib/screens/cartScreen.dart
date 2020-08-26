import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantshop/components/TopAppBar.dart';
import 'package:plantshop/listData/lists.dart';
import 'package:plantshop/modelClass/viewTotalItem.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

OurAllLists ourAllLists = OurAllLists();

class CartDetais3 extends StatefulWidget {
  @override
  _CartDetais3State createState() => _CartDetais3State();
}

class _CartDetais3State extends State<CartDetais3> {
  createAlertDialog(BuildContext context,int theIndex) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Text("Remove this item from cart?"),
            actions: [
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  viewTotalItemProvider.removingItem(theIndex);
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  viewTotalItemProvider.resetingItemValue(theIndex);
                },
                child: Text("No"),
              )
            ],
          );
        });
  }

  @override
  ViewTotalItemProvider viewTotalItemProvider;
  int itemIndex;
  Widget build(BuildContext context) {
    viewTotalItemProvider = Provider.of<ViewTotalItemProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 15),
        child: Column(
          children: [
            TopAppBar(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cart",
                  style: kPlantNameStyle,
                ),
                RichText(
                  text: TextSpan(
                    text: '\$ ',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF96CA2D)),
                    children: <TextSpan>[
                      TextSpan(
                          text: viewTotalItemProvider.totalPrice().toString(),
                          style: kItemPrice),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: viewTotalItemProvider.cartPlantList3.length,
                  itemBuilder: (context, index) {
                    print("the index is " + itemIndex.toString());
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        viewTotalItemProvider.removingItem(index);
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Icon(Icons.close,
                              size: 25, color: Colors.white),
                        ),
                        decoration: BoxDecoration(color: Color(0xFF96CA2D)),
                      ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 120,
                                    width: 100,
                                    child: Image(
                                        image: AssetImage(ourAllLists
                                            .mainListAllPlantDetailsList1[index]
                                            .pI))),
                                Container(
                                  height: 120,
                                  width: 120,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          viewTotalItemProvider
                                              .cartPlantList3[index].pN,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        viewTotalItemProvider
                                            .cartPlantList3[index].ca
                                            .toUpperCase(),
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "\$ " +
                                            viewTotalItemProvider
                                                .cartPlantList3[index].pr
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF2F3030),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: 120,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20),
                                            bottom: Radius.circular(20))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        FlatButton(
                                          onPressed: () {
                                            viewTotalItemProvider
                                                .addQuantity(index);
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.plus,
                                            size: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(viewTotalItemProvider
                                            .cartPlantList3[index].qu
                                            .toString()),
                                        FlatButton(
                                          onPressed: () {
                                            viewTotalItemProvider
                                                .subtrachQuantity(index);
                                            if (viewTotalItemProvider
                                                    .cartPlantList3[index].qu ==
                                                0) {
                                                  createAlertDialog(context,index);
                                                }
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.minus,
                                            size: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(170, 0, 20, 20),
              child: Container(
                height: 65,
                width: 180,
                decoration: BoxDecoration(
                    color: Color(0xFF96CA2D),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(35), right: Radius.circular(35))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Checkout",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    Icon(
                      FontAwesomeIcons.arrowRight,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:plantshop/listData/listClasses.dart';
import 'package:plantshop/screens/cartScreen.dart';

class ViewTotalItemProvider extends ChangeNotifier {
  int _activeIndex = 0;
  int get activeIndex => _activeIndex;

  set activeIndex(int aI) {
    _activeIndex = aI;
    notifyListeners();
  }

  List<CartPlantLists> _cartPlantList3 = [];
  List<CartPlantLists> get cartPlantList3 => _cartPlantList3;

  set cartPlantList3(List<CartPlantLists> val) {
    _cartPlantList3 = val;
    notifyListeners();
  }

  addQuantity(index) {
    if (_cartPlantList3[index].qu >= 0) {
      _cartPlantList3[index].qu++;
    } else {
      _cartPlantList3[index].qu = _cartPlantList3[index].qu;
    }
    notifyListeners();
  }

  subtrachQuantity(index) {
    if (_cartPlantList3[index].qu > 0) {
      _cartPlantList3[index].qu--;
      notifyListeners();
    } else {
      _cartPlantList3[index].qu = _cartPlantList3[index].qu;
      notifyListeners();
    }
  }

  int totalquantity() {
    int totalItems = 0;
    for (var i = 0; i < cartPlantList3.length; i++) {
      totalItems = totalItems + cartPlantList3[i].qu;
    }
    return totalItems;
  }

  addItems(CartPlantLists myList) {
    cartPlantList3.add(myList);
    notifyListeners();
  }

  int totalPrice() {
    int allCartTotalPrice = 0;
    for (var i = 0; i < cartPlantList3.length; i++) {
      allCartTotalPrice += cartPlantList3[i].pr * cartPlantList3[i].qu;
    }
    return allCartTotalPrice;
  }

  removingItem(int index) {
    cartPlantList3.removeAt(index);
    notifyListeners();
  }

  int particularItemCalculation(int indexNumber) {
    int total = 0;
    for (var i = 0; i < cartPlantList3.length; i++) {
      if (ourAllLists.mainListAllPlantDetailsList1[indexNumber].pN ==
          cartPlantList3[i].pN) {
        total = cartPlantList3[i].qu;
        return total;
      }
    }
    return total;
  }

  resetingItemValue(int itemIndex) {
    cartPlantList3[itemIndex].qu = 1;
    notifyListeners();
  }
}

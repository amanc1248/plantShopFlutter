class PlantDetails{
  int iN;
  String ca;
  String pN;
  String des;
  int pr;
  String pI;
  String li;
  String wa;
  String temp;
  PlantDetails({int indexNumber,String category,String plantName, String description, int price, String plantImage,String light, String water, String temperature}){
     iN = indexNumber;
     ca = category;
     pN  = plantName;
     des = description;
     pr =price;
     pI= plantImage;
     li = light;
     wa = water;
     temp = temperature;
  }
}
class TopPlants{
    int iN;
  String ca;
  String pN;
  String des;
  int pr;
  TopPlants({int indexNumber,String category,String plantName, String description, int price}){
     iN = indexNumber;
     ca = category;
     pN  = plantName;
     des = description;
     pr =price;
  }
}

class CartPlantLists{
     int iN;
  String ca;
  String pN;
  int pr;
  int qu = 0;
  CartPlantLists({int indexNumber,String category,String plantName, int quantity, int price}){
     qu = quantity;
     iN = indexNumber;
     ca = category;
     pN  = plantName;
     pr =price;
  }
}
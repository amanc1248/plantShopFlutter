import 'package:flutter/material.dart';
import 'package:plantshop/modelClass/viewTotalItem.dart';
import 'package:plantshop/screens/plantFeatureScreen1.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ViewTotalItemProvider>(
            create: (context) => ViewTotalItemProvider()),
            
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: PlantFeatureScreen1(),
            ),
          )),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

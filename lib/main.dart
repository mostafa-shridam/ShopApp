import 'package:ahmed/helper/componants.dart';
import 'package:ahmed/screens/add_product_screen.dart';
import 'package:ahmed/screens/home-screen.dart';
import 'package:ahmed/widgets/category_card.dart';
import 'package:ahmed/widgets/products_card.dart';
import 'package:ahmed/screens/product_detials_screen.dart';
import 'package:ahmed/screens/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myCustomColor,
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      initialRoute: HomeScreen.id,
      routes: {
        ProductsCard.id: (context) => const ProductsCard(),
        ProductDetials.id: (context) => const ProductDetials(),
        UpdateProductScreen.id: (context) => const UpdateProductScreen(),
        HomeScreen.id: (context) =>  HomeScreen(),
        CategoryCard.id: (context) => const CategoryCard(),
        AddProductScreen.id: (context) =>  AddProductScreen(),
      },
    );
  }
}


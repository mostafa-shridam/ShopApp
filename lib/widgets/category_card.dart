import 'dart:developer';

import 'package:ahmed/helper/componants.dart';
import 'package:ahmed/services/get_categories.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  static String id = 'category';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 70,
        child: FutureBuilder(
          future: GetCategoriesProduct().getAllCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> data = snapshot.data!;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildStack(categoryName: 'electronics',onTap: (){
                      log(data.toString());
                    }),
                    const SizedBox(
                      width: 8,
                    ),
                    buildStack(categoryName: 'jewelery'),
                    const SizedBox(
                      width: 8,
                    ),
                    buildStack(categoryName: 'men\'s clothing'),
                    const SizedBox(
                      width: 8,
                    ),
                    buildStack(categoryName: 'women\'s clothing'),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  InkWell buildStack({required String categoryName, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: 120,
            decoration: BoxDecoration(
              color: defaultColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
          Text(
            categoryName,
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

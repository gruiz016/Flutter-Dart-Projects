import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              title: catData.title,
              color: catData.color,
              id: catData.id,
            ),
          )
          .toList(),
    );
  }
}

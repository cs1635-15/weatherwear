// lib/widgets/clothing_list_tile.dart
import 'package:flutter/material.dart';
import '../models/clothing.dart';
import '../screens/category_detail_screen.dart'; 

class ClothingListTile extends StatelessWidget {
  final String category;
  final List<Clothing> clothes;

  const ClothingListTile({
    Key? key,
    required this.category,
    required this.clothes, required Null Function() onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category),
      subtitle: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: clothes
              .map((clothing) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      clothing.imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ))
              .toList(),
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // show clothes list
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryDetailScreen(
              category: category,
              clothes: clothes,
            ),
          ),
        );
      },
    );
  }
}

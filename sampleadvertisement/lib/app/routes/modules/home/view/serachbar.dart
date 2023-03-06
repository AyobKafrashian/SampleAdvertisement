import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/search_controller.dart';

class SearchBar extends StatelessWidget {
  final SearchController searchController = Get.put(SearchController());
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {
                searchController.setSearchQuery(controller.text);
              },
              icon: Icon(Icons.search),
            ),
            hintText: 'جستجو',
            hintStyle: TextStyle(
                fontSize: 14, fontFamily: 'Vazir', color: Colors.black),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          ),
        ),
      ),
    );
  }
}

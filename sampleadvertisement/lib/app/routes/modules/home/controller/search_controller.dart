import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SearchController extends GetxController {
  var searchQuery = ''.obs;
  var searchResults = [].obs;

  void setSearchQuery(String query) {
    searchQuery.value = query;
    search(searchQuery.value);
  }

  void search(String query) async {
    var response =
        await http.get(Uri.parse('http://192.168.9.112:83/api/home?q=$query'));
    var data = json.decode(response.body);
    searchResults.value = data;
  }
}

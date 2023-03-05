import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../../model/advertisment_model.dart';

class HomeController extends GetxController {
  //final List<Map<String, dynamic>> allPlayers = [
  //  {"name": "Rohit Sharma", "country": "India"},
  //  {"name": "Virat Kohli ", "country": "India"},
  //  {"name": "Glenn Maxwell", "country": "Australia"},
  //  {"name": "Aaron Finch", "country": "Australia"},
  //  {"name": "Martin Guptill", "country": "New Zealand"},
  //  {"name": "Trent Boult", "country": "New Zealand"},
  //  {"name": "David Miller", "country": "South Africa"},
  //  {"name": "Kagiso Rabada", "country": "South Africa"},
  //  {"name": "Chris Gayle", "country": "West Indies"},
  //  {"name": "Jason Holder", "country": "West Indies"},
  //];
  //Rx<List<Map<String, dynamic>>> foundPlayers =
  //    Rx<List<Map<String, dynamic>>>([]);

  //@override
  //void onInit() {
  //  super.onInit();
  //  foundPlayers.value = allPlayers;
  //}

  //@override
  //void onReady() {
  //  super.onReady();
  //}

  //@override
  //void onClose() {}
  //void filterPlayer(String playerName) {
  //  List<Map<String, dynamic>> results = [];
  //  if (playerName.isEmpty) {
  //    results = allPlayers;
  //  } else {
  //    results = allPlayers
  //        .where((element) => element["name"]
  //            .toString()
  //            .toLowerCase()
  //            .contains(playerName.toLowerCase()))
  //        .toList();
  //  }
  //  foundPlayers.value = results;
  //}

  final List<Map<String, dynamic>> allAdvertisements = [
    {
      "id": "1",
      "title": "آپارتمان در جردن",
      "reference": "دیوار",
      "pictureLink":
          "https://s100.divarcdn.com/static/thumbnails/1677938210/wYx_cqXV.webp",
      "urlLink":
          "https://divar.ir/v/%D8%A7%D8%AC%D8%A7%D8%B1%D9%87-%D8%A7%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86%DB%B3-%D8%AE%D9%88%D8%A7%D8%A8-%DB%B2%DB%B1%DB%B0-%D9%85%D8%AA%D8%B1%DB%8C-%D8%AF%D9%88%D9%BE%D8%A7%D8%B1%DA%A9%DB%8C%D9%86%DA%AF-%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%A2%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86_%D8%AA%D9%87%D8%B1%D8%A7%D9%86_%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%AF%DB%8C%D9%88%D8%A7%D8%B1/wYx_cqXV",
    },
    {
      "id": "2",
      "title": "آپارتمان در جردن",
      "reference": "دیوار",
      "pictureLink":
          "https://s100.divarcdn.com/static/thumbnails/1677938210/wYx_cqXV.webp",
      "urlLink":
          "https://divar.ir/v/%D8%A7%D8%AC%D8%A7%D8%B1%D9%87-%D8%A7%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86%DB%B3-%D8%AE%D9%88%D8%A7%D8%A8-%DB%B2%DB%B1%DB%B0-%D9%85%D8%AA%D8%B1%DB%8C-%D8%AF%D9%88%D9%BE%D8%A7%D8%B1%DA%A9%DB%8C%D9%86%DA%AF-%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%A2%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86_%D8%AA%D9%87%D8%B1%D8%A7%D9%86_%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%AF%DB%8C%D9%88%D8%A7%D8%B1/wYx_cqXV",
    },
    {
      "id": "3",
      "title": "آپارتمان در جردن",
      "reference": "دیوار",
      "pictureLink":
          "https://s100.divarcdn.com/static/thumbnails/1677938210/wYx_cqXV.webp",
      "urlLink":
          "https://divar.ir/v/%D8%A7%D8%AC%D8%A7%D8%B1%D9%87-%D8%A7%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86%DB%B3-%D8%AE%D9%88%D8%A7%D8%A8-%DB%B2%DB%B1%DB%B0-%D9%85%D8%AA%D8%B1%DB%8C-%D8%AF%D9%88%D9%BE%D8%A7%D8%B1%DA%A9%DB%8C%D9%86%DA%AF-%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%A2%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86_%D8%AA%D9%87%D8%B1%D8%A7%D9%86_%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%AF%DB%8C%D9%88%D8%A7%D8%B1/wYx_cqXV",
    },
    {
      "id": "4",
      "title": "آپارتمان در جردن",
      "reference": "دیوار",
      "pictureLink":
          "https://s100.divarcdn.com/static/thumbnails/1677938210/wYx_cqXV.webp",
      "urlLink":
          "https://divar.ir/v/%D8%A7%D8%AC%D8%A7%D8%B1%D9%87-%D8%A7%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86%DB%B3-%D8%AE%D9%88%D8%A7%D8%A8-%DB%B2%DB%B1%DB%B0-%D9%85%D8%AA%D8%B1%DB%8C-%D8%AF%D9%88%D9%BE%D8%A7%D8%B1%DA%A9%DB%8C%D9%86%DA%AF-%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%A2%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86_%D8%AA%D9%87%D8%B1%D8%A7%D9%86_%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%AF%DB%8C%D9%88%D8%A7%D8%B1/wYx_cqXV",
    },
    {
      "id": "5",
      "title": "آپارتمان در جردن",
      "reference": "دیوار",
      "pictureLink":
          "https://s100.divarcdn.com/static/thumbnails/1677938210/wYx_cqXV.webp",
      "urlLink":
          "https://divar.ir/v/%D8%A7%D8%AC%D8%A7%D8%B1%D9%87-%D8%A7%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86%DB%B3-%D8%AE%D9%88%D8%A7%D8%A8-%DB%B2%DB%B1%DB%B0-%D9%85%D8%AA%D8%B1%DB%8C-%D8%AF%D9%88%D9%BE%D8%A7%D8%B1%DA%A9%DB%8C%D9%86%DA%AF-%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%A2%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86_%D8%AA%D9%87%D8%B1%D8%A7%D9%86_%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%AF%DB%8C%D9%88%D8%A7%D8%B1/wYx_cqXV",
    },
    {
      "id": "",
      "title": "آپارتمان در جردن",
      "reference": "دیوار",
      "pictureLink":
          "https://s100.divarcdn.com/static/thumbnails/1677938210/wYx_cqXV.webp",
      "urlLink":
          "https://divar.ir/v/%D8%A7%D8%AC%D8%A7%D8%B1%D9%87-%D8%A7%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86%DB%B3-%D8%AE%D9%88%D8%A7%D8%A8-%DB%B2%DB%B1%DB%B0-%D9%85%D8%AA%D8%B1%DB%8C-%D8%AF%D9%88%D9%BE%D8%A7%D8%B1%DA%A9%DB%8C%D9%86%DA%AF-%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%A2%D9%BE%D8%A7%D8%B1%D8%AA%D9%85%D8%A7%D9%86_%D8%AA%D9%87%D8%B1%D8%A7%D9%86_%D8%B3%D8%B9%D8%A7%D8%AF%D8%AA-%D8%A2%D8%A8%D8%A7%D8%AF_%D8%AF%DB%8C%D9%88%D8%A7%D8%B1/wYx_cqXV",
    },
  ];
  List<Advertisement_Model>? advertisement_model_list = [];

  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('http://192.168.9.112:83/api/home')!,
          headers: {'Accept': 'application/json;'});
      if (response.statusCode == 200) {
        //data successfully
        var result = jsonDecode(response.body);
        advertisement_model_list = [];
        result['data'].forEach((value) {
          advertisement_model_list!.add(Advertisement_Model.fromJson(value));
        });
        print(result['data']);
        update();

        //allPlayers.forEach((value) {
        //  advertisment_model_list!.add(Advertisment_Model.fromJson(value));
        //});
      } else {}
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }

  launchLink(String url) async {
    final Uri _url = Uri.parse(url);
    print("click");

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  showing_logo(String reference) {
    switch (reference) {
      case 'Divar':
        return 'assets/images/divar.png';

      case 'Sheypoor':
        {
          return 'assets/images/sheypoor.png';
        }

      default:
        {
          //statements;
        }
        break;
    }
  }
}

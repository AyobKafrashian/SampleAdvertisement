import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleadvertisement/app/routes/modules/home/view/serachbar.dart';

import 'package:url_launcher/url_launcher.dart';

import '../controller/Home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController advertisementController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(31, 41, 55, 1),
        title: const Text(
          'آگهی ها',
          style: TextStyle(fontFamily: 'Vazir'),
        ),
        centerTitle: true,
      ),
      body:
          //RefreshIndicator(

          //onRefresh: () async {
          //  advertisementController.getApi();
          //},
          //  color: Colors.red,
          //  child:
          Obx(() => advertisementController.isDataLoading.value
              ? const Center(child: CircularProgressIndicator())
              :

              //  ?
              Column(
                  children: [
                    SearchBar(),
                    Expanded(
                      child: RefreshIndicator(
                          onRefresh: () async {
                            advertisementController.getApi();
                          },
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics(),
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: advertisementController
                                  .advertisement_model_list!.length,
                              itemBuilder:
                                  //advertisementController
                                  //    .advertisement_model_list!.length !=
                                  //0
                                  // ?
                                  (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    advertisementController.launchLink(
                                        advertisementController
                                            .advertisement_model_list![index]
                                            .urlLink!);
                                  },
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child:
                                        //Column(
                                        //children: [
                                        //  const SizedBox(
                                        //    height: 10,
                                        //  ),

                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 5,
                                                bottom: 5),
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 10,
                                                top: 10,
                                                bottom: 10),
                                            height: 205,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: advertisementController
                                                                .advertisement_model_list![
                                                                    index]
                                                                .reference ==
                                                            "Divar"
                                                        ? Colors.red
                                                        : Colors.blue,
                                                    width: 1),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      //border: Border.all(
                                                      //    color: advertismentController
                                                      //                .advertisment_model_list![
                                                      //                    index]
                                                      //                .reference ==
                                                      //            "Divar"
                                                      //        ? Colors.red
                                                      //        : Colors.blue,
                                                      //    width: 3),
                                                      color: Colors.white,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SizedBox.fromSize(
                                                        size:
                                                            Size.fromRadius(57),
                                                        child: advertisementController
                                                                    .advertisement_model_list![
                                                                        index]
                                                                    .imageUrl! ==
                                                                "none"
                                                            ? Container(
                                                                child: Center(
                                                                  child: Text(
                                                                    "بدون تصویر",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontFamily:
                                                                            'Vazir',
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        31,
                                                                        41,
                                                                        55,
                                                                        1),
                                                              )
                                                            : Image.network(
                                                                advertisementController
                                                                    .advertisement_model_list![
                                                                        index]
                                                                    .imageUrl!,
                                                                width: 90,
                                                                height: 200,
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 30,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        advertisementController
                                                            .advertisement_model_list![
                                                                index]
                                                            .title!
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontFamily: 'Vazir',
                                                            fontSize: 15),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10,
                                                                  bottom: 10),
                                                          child: Text(
                                                            advertisementController
                                                                .advertisement_model_list![
                                                                    index]
                                                                .rent!,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    'Vazir',
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                      advertisementController
                                                                  .advertisement_model_list![
                                                                      index]
                                                                  .reference! !=
                                                              null
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              child: SizedBox
                                                                  .fromSize(
                                                                      size: Size
                                                                          .fromRadius(
                                                                              20),
                                                                      child: Image.asset(
                                                                          advertisementController
                                                                              .showing_logo(
                                                                        advertisementController
                                                                            .advertisement_model_list![index]
                                                                            .reference!,
                                                                      ))),
                                                            )
                                                          : Container()
                                                      //Text(
                                                      //advertismentController
                                                      //    .advertisment_model_list![index]
                                                      //    .reference!,
                                                      //    style: const TextStyle(
                                                      //        color: Colors.black,
                                                      //        fontSize: 10)
                                                      //        ),
                                                      //Text(
                                                      //    advertismentController.advertisment_model_list
                                                      //        [index].reference!,
                                                      //    style: const TextStyle(
                                                      //        color: Colors.black, fontSize: 18)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                  ),
                                  //  const SizedBox(
                                  //    height: 10,
                                  //  )
                                  //],
                                  // ),
                                );
                              })),
                    ),
                  ],
                )),
    );
  }
}

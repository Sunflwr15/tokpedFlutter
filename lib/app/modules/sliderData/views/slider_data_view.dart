import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

import '../../../controllers/slider_controller.dart';
import '../../splashScreen/config/warna.dart';
import '../controllers/slider_data_controller.dart';

class SliderDataView extends GetView<SliderDataController> {
  final sliderC = Get.put(SliderController());
  final controller = Get.put(SliderDataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Scaffold(
      body: Container(
        child: FutureBuilder<QuerySnapshot<Object?>>(
            future: sliderC.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var listData = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () => Get.toNamed(Routes.UPDATE_SLIDER,
                              arguments: listData[index]),
                          onLongPress: () =>
                              sliderC.deleteData(listData[index].id),
                          title: Text(
                            (listData[index].data()
                                as Map<String, dynamic>)['deskripsi_slider'],
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            (listData[index].data()
                                    as Map<String, dynamic>)['active_slider']
                                .toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: (listData[index].data() as Map<String,
                                        dynamic>)['active_slider']
                                    ? bgHeader
                                    : Colors.red,
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Container(
                            child: Image.network((listData[index].data()
                                as Map<String, dynamic>)['image_slider']),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              sliderC.deleteData((listData[index].id));
                            },
                            icon: Icon(
                              CupertinoIcons.trash,
                              color: Colors.red,
                            ),
                          ),
                        ));
              } else {
                return (Center(
                  child: CircularProgressIndicator(),
                ));
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CREATE_SLIDER),
        child: Icon(CupertinoIcons.add),
      ),
    )));
  }
}

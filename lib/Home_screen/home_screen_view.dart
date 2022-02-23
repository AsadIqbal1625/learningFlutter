//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypoll/Home_screen/drawer.dart';
import 'package:mypoll/Home_screen/home_Screen_controller.dart';
import 'package:mypoll/const/const.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    final controller = Get.put(HomeScreenController());
    return Container(
      color: Colors.blue[400],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Lucky Dream"),
            backgroundColor: Colors.blue[400],
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
            ],
          ),
          //Homescreen drawer class is calling from home
          drawer: HomeScreenDrawer(),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
                child: Column(
              children: [
                // front Banner
                SizedBox(
                  height: size.height / 3,
                  width: size.width / 1,
                  child: PageView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(image),
                          )),
                        ),
                      );
                    },
                  ),
                ),
                //indicator : rolling indicator on front screen below banner
                SizedBox(
                  height: size.height / 25,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 4; i++) indicacator(size, false)
                    ],
                  ),
                ),
                //Categories
                categoriesTitle(size, "All categories", () {}),
                listViewBuilder(size),
                SizedBox(
                  height: size.height / 25,
                ),
                categoriesTitle(size, "Winners", () {}),
                listViewBuilderwinner(size),
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget listViewBuilder(Size size) {
    return SizedBox(
      height: size.height / 9,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return listViewBuilderItems(size, images[index]);
        },
      ),
    );
  }

  Widget listViewBuilderwinner(Size size) {
    return SizedBox(
      height: size.height / 3,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return listViewBuilderItems(size, images[index]);
        },
      ),
    );
  }

  Widget listViewBuilderItems(Size size, Categories categories) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        height: size.height / 5,
        width: size.height / 4,
        child: Column(
          children: [
            Container(
              height: size.height / 10,
              width: size.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(categories.img),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Text(
                  categories.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoriesTitle(Size size, String title, Function function) {
    return SizedBox(
      height: size.height / 18,
      width: size.width / 1.1,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        TextButton(
          onPressed: () => function(),
          child: const Text(
            " View All",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 16,
            ),
          ),
        ),
      ]),
    );
  }

  Widget indicacator(Size size, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: isSelected ? size.height / 80 : size.height / 100,
        width: isSelected ? size.height / 80 : size.height / 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
      ),
    );
  }
}

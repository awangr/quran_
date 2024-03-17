import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/modules/doa/views/doa_view.dart';
import 'package:quran_api/app/modules/home/controllers/home_controller.dart';
import 'package:quran_api/app/modules/home_quran/views/home_quran_view.dart';

class HomeView extends GetView<HomeController> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
        centerTitle: true,
        title: Text(
          'القرآن',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Positioned(
                          left: 30,
                          top: 70,
                          child: Column(
                            children: [
                              Text(
                                'Al-Fatihah',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 50),
                              CircleAvatar(
                                child: Center(
                                  child: Icon(Icons.play_arrow_sharp),
                                ),
                              )
                            ],
                          )),
                      Positioned(
                          bottom: 6,
                          right: 10,
                          child: Container(
                            width: 190,
                            height: 190,
                            child: Image.asset(
                              'asset/images/quran.png',
                              fit: BoxFit.contain,
                            ),
                          ))
                    ],
                  ),
                  width: Get.width,
                  height: 250,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 20,
                            offset: Offset(10, 10))
                      ],
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [
                        Colors.teal.shade500,
                        Colors.teal.shade400,
                        Colors.teal.shade100
                      ])),
                ),
                SizedBox(height: 40),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: Menu.listMenu.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: Menu.listMenu[index].onTap,
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned(
                                left: 20,
                                top: 20,
                                child: Text(
                                  Menu.listMenu[index].text,
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                            Positioned(
                                bottom: 10,
                                right: 10,
                                child: Image.asset(Menu.listMenu[index].image,
                                    width: 100))
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Menu.listMenu[index].color
                                .withOpacity(0.4) /*color.withOpacity(0.8)*/),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Menu {
  String image;
  String text;
  Color color;
  Function()? onTap;
  Menu(this.image, this.text, this.color, this.onTap);
  static List<Menu> listMenu = [
    Menu('asset/images/qoroa.png', 'Quran', Colors.teal.shade400, () {
      Get.to(HomeQuranView());
    }),
    Menu('asset/images/headphone.png', 'Murotal', Colors.amber.shade400, () {}),
    Menu('asset/images/doa.png', 'Doa-Doa', Colors.blue.shade400, () {
      Get.to(DoaView());
    }),
    Menu(
        'asset/images/adzan.png', 'Jadwal Sholat', Colors.cyan.shade400, () {}),
  ];
}

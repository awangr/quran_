import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuView extends GetView<MenuController> {
  Widget build(BuildContext context) {
    final List<String> gridImage = [
      'asset/images/qoroa.png',
      'asset/images/headphone.png',
      'asset/images/doa.png',
      'asset/images/qoroa.png'
    ];
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
                    Color color;
                    switch (index) {
                      case 0:
                        color = Colors.teal.shade400;
                        break;
                      case 1:
                        color = Colors.amber.shade400;
                        break;
                      case 2:
                        color = Colors.blue.shade400;
                      case 3:
                        color = Colors.cyan.shade400;
                      default:
                        color = Colors.white;
                    }
                    return Container(
                      child: Stack(
                        children: [
                          Positioned(
                              left: 20,
                              top: 20,
                              child: Text(Menu.listMenu[index].text)),
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
                              .withOpacity(0.8) /*color.withOpacity(0.8)*/),
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
  Menu(this.image, this.text, this.color);
  static List<Menu> listMenu = [
    Menu('asset/images/qoroa.png', 'Quran', Colors.teal.shade400),
    Menu('asset/images/headphone.png', 'Murotal', Colors.amber.shade400),
    Menu('asset/images/doa.png', 'Doa-Doa', Colors.blue.shade400),
    Menu('asset/images/adzan.png', 'Jadwal Sholat', Colors.cyan.shade400),
  ];
}

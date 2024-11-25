import 'package:flutter/material.dart';
import 'package:pos_flutter/core/utils/color.dart';
import 'package:pos_flutter/core/widgets/custom_internet_app_bar.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({super.key});

  

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> screens = [
    {"icon": Icons.home, "title": "الرئسية", "onTap": () {}},
    {"icon": Icons.replay, "title": "مرتجعات", "onTap": () {}},
    {"icon": Icons.assignment_rounded, "title": "فواتير", "onTap": () {}},
    {"icon": Icons.shelves, "title": "المخزن", "onTap": () {}},
    {
      "icon": Icons.insert_chart_outlined_outlined,
      "title": "مدفوعات",
      "onTap": () {}
    },
    {"icon": Icons.ssid_chart_outlined, "title": "تقارير", "onTap": () {}},
    {"icon": Icons.logout_outlined, "title": "تسجيل الخروج", "onTap": () {}},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: customInternetAppBar(),
        body: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(
              right: 15.0,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 28,
                color: AppColor.red,
              ),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: AppColor.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 150,
                  child: Center(
                    child: Text(
                      'L O G O',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                      text: 'Business name: ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black),
                      children: [
                        TextSpan(
                          text: 'Heliopolis',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]),
                ),
                RichText(
                  text: const TextSpan(
                      text: 'User Name: ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black),
                      children: [
                        TextSpan(
                          text: 'mahmoud test',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: screens.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          screens[index]["title"].toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        leading: Icon(
                          screens[index]["icon"],
                          size: 25,
                        ),
                        onTap: screens[index]["onTap"],
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 40),
                      backgroundColor: AppColor.grey.shade400,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'بدأ الوردية',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  
}

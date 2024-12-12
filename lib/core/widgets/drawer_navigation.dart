import 'package:flutter/material.dart';
import 'package:pos_flutter/config/style/app_colors.dart';

class DrawerNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const DrawerNavigation({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> screens = [
      {
        "icon": Icons.home,
        "title": "الرئسية",
      },
      {
        "icon": Icons.replay,
        "title": "مرتجعات",
      },
      {
        "icon": Icons.assignment_rounded,
        "title": "فواتير",
      },
      {
        "icon": Icons.shelves,
        "title": "المخزن",
      },
      {
        "icon": Icons.insert_chart_outlined_outlined,
        "title": "مدفوعات",
      },
      {
        "icon": Icons.ssid_chart_outlined,
        "title": "تقارير",
      },
      {
        "icon": Icons.logout_outlined,
        "title": "تسجيل الخروج",
      },
    ];
    return Drawer(
      backgroundColor: AppColors.white,
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
                      color: AppColors.black),
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
                      color: AppColors.black),
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
                  return _drawerNavItem(
                      text: screens[index]['title'],
                      icon: screens[index]['icon'],
                      index: index,
                      context: context);
                }),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 40),
                  backgroundColor: AppColors.grey7,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onPressed: () {},
                child: const Text(
                  'بدأ الوردية',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _drawerNavItem(
      {required String text,
      required IconData icon,
      required int index,
      required BuildContext context}) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      leading: Icon(
        icon,
        size: 25,
      ),
      onTap: () {
        Navigator.of(context).pop();
        onTap!.call(index);
      },
    );
  }
}

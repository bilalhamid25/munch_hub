import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:munch_hub/helper/global_variables.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Drawer(
        child: ListView(children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              width: 85,
              height: 85,
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          DrawerItem(
              title: 'Home',
              icon: Icons.home,
              onTap: () {
                Get.back();
                GlobalVariables.selectedIndex.value = 2;
              }),
          DrawerItem(
              title: 'Profile',
              icon: Icons.person,
              onTap: () {
                Get.back();
                GlobalVariables.selectedIndex.value = 3;
              }),
          DrawerItem(
              title: 'My Orders',
              icon: Icons.reorder,
              onTap: () {
                Get.back();
                // Get.to(() => CartView());
                // HomeViewModel model = Get.find();
                // model.selectedIndex.value = 0;
              }),
          DrawerItem(
              title: 'Favorites',
              icon: Icons.favorite_border_rounded,
              onTap: () {
                Get.back();
                //   Get.to(() => HomeView());
              }),
          const Divider(),
          DrawerItem(
              title: 'Logout',
              icon: Icons.exit_to_app,
              onTap: () {
                GlobalVariables.token.value = "";
                GlobalVariables.userFirstName.value = "";
                GlobalVariables.userLastName.value = "";
                GlobalVariables.userEmail.value = "";
                GlobalVariables.selectedIndex.value = 3;
              }),
        ]),
      ),
    );
  }
}

// class DrawerHeader extends StatelessWidget {
//   final String name;
//
//   DrawerHeader({required this.name});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: new Color(0xF8F9FA),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 45,
//               backgroundColor: Get.theme.primaryColor,
//               child: const Icon(Icons.person, size: 45),
//             ),
//             const SizedBox(
//               height: 6,
//             ),
//             Text(
//               name,
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.bold,
//                 color: Get.theme.primaryColor,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final GestureTapCallback onTap;

  const DrawerItem(
      {Key? key,
      this.iconSize = 20,
      required this.onTap,
      required this.icon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 5,
      dense: true,
      contentPadding: const EdgeInsets.only(left: 20),
      leading: FaIcon(
        icon,
        size: iconSize,
        color: const Color(0xff031F4B),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//   Widget drawerExpandableItem(
//       {String title = '',
//       required IconData icon,
//       double iconSize = 19,
//       required List<Widget> children}) {
//     return ListTileTheme(
//       horizontalTitleGap: -14,
//       dense: true,
//       child: ExpansionTile(
// // textColor: Color(0xff622260),
// // iconColor: Color(0xff622260),
//         tilePadding: EdgeInsets.only(left: 10, right: 20),
//         title: Text(
//           title,
//           style: TextStyle(
//             fontSize: 16,
//             fontFamily: 'Roboto-Regular',
// //fontWeight: FontWeight.w00
//           ),
//         ),
//         leading: Container(
//           child: Icon(
//             icon,
//             size: iconSize,
//             color: Colors.grey,
//           ),
//         ),
//         children: children,
//       ),
//     );
//   }

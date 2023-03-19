import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_hub/helper/global_variables.dart';
// import 'package:munch_hub/screens/cart/cart_view.dart';
import 'package:munch_hub/screens/navigation_drawer/navigation_drawer_viewmodel.dart';
// import 'package:munch_hub/widgets/custom_drawer.dart';

class NavigationDrawerView extends StatelessWidget {
  final NavigationDrawerViewModel navigationDrawerViewModel =
      Get.put(NavigationDrawerViewModel());

  NavigationDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return navigationDrawerViewModel.onBackPressed(context);
      },
      child: Scaffold(
        bottomSheet: bottomNotchedAppBar(),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Obx(
            () => navigationDrawerViewModel.selectView(
                GlobalVariables.selectedIndex.value, context),
          ),
        ),
        floatingActionButton: floatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //  bottomNavigationBar: bottomNotchedAppBar(),
      ),
    );
  }

  Widget floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        GlobalVariables.selectedIndex.value = 2;
      },
      tooltip: 'Home',
      child: Obx(() => Icon(
            Icons.home,
            size: 32,
            color: (GlobalVariables.selectedIndex.value == 2)
                ? Get.theme.primaryColor
                : const Color(0xff9B9B9B),
          )),
    );
  }

  Widget bottomNotchedAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => navigationDrawerViewModel.assignIndex(0),
                    child: Obx(
                      () => Icon(
                        Icons.map,
                        size: 32,
                        color: (GlobalVariables.selectedIndex.value == 0)
                            ? Get.theme.primaryColor
                            : const Color(0xff9B9B9B),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigationDrawerViewModel.assignIndex(1),
                    child: Obx(
                      () => Icon(
                        Icons.reorder,
                        size: 32,
                        color: (GlobalVariables.selectedIndex.value == 1)
                            ? Get.theme.primaryColor
                            : const Color(0xff9B9B9B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 0,
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => navigationDrawerViewModel.assignIndex(3),
                    child: Obx(
                      () => Icon(
                        Icons.person_rounded,
                        size: 32,
                        color: (GlobalVariables.selectedIndex.value == 3)
                            ? Get.theme.primaryColor
                            : const Color(0xff9B9B9B),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigationDrawerViewModel.assignIndex(4),
                    child: Obx(
                      () => Icon(
                        Icons.favorite_border_rounded,
                        size: 32,
                        color: (GlobalVariables.selectedIndex.value == 4)
                            ? Get.theme.primaryColor
                            : const Color(0xff9B9B9B),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/screens/main/components/side_menu_ctrl.dart';
import 'package:jaji_admin/screens/router/router_ctrl.dart';

///Menu hiển thị các chức năng của app
class SideMenu extends StatelessWidget {
  SideMenu({
    Key? key,
  }) : super(key: key);
  final RouterCtrl routerCtrl = Get.put(RouterCtrl());
  final SideMenuCtrl sideMenuCtrl = Get.put(SideMenuCtrl());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashbord",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Quiz Manager",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              sideMenuCtrl.updateVisible();
            },
          ),
          Obx(
            () => Visibility(
              visible: sideMenuCtrl.visibleOfMenuQs.value,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: DrawerListTile(
                      title: "Thêm",
                      svgSrc: "assets/icons/menu_tran.svg",
                      press: () {
                        routerCtrl.routerSetting('quiz');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: DrawerListTile(
                      title: "Sửa, Xóa",
                      svgSrc: "assets/icons/menu_tran.svg",
                      press: () {
                        routerCtrl.routerSetting('quiz');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          DrawerListTile(
            title: "Task",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Documents",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Store",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}

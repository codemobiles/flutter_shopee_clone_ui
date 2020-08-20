import 'package:flutter/material.dart';
import 'package:flutter_shopee_clone_ui/src/models/menu_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MenuViewModel {
  List<MenuModel> getMenus() {
    return [
      MenuModel(
        icon: MdiIcons.homeOutline,
        iconSelected: Icons.thumb_up,
        label: "สินค้าแนะนำประจำวัน",
      ),
      MenuModel(
        icon: Icons.filter_none,
        iconSelected: Icons.filter_none,
        label: "Feed",
      ),
      MenuModel(
        icon: MdiIcons.videoOutline,
        iconSelected: MdiIcons.video,
        label: "Shopee Live",
      ),
      MenuModel(
        icon: MdiIcons.bellOutline,
        iconSelected: MdiIcons.bell,
        label: "การแจ้งเตือน",
      ),
      MenuModel(
        icon: MdiIcons.accountOutline,
        iconSelected: MdiIcons.account,
        label: "ฉัน",
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:medlink/model/drawer_item.dart';

class DrawerItems {
  static const doctors =
      DrawerItem(title: "Mənim həkimlərim", icon: Icons.person);
  static const medInfo = DrawerItem(
      title: "Tibbi məlumatlarım", icon: Icons.medical_information_sharp);
  static const payments = DrawerItem(title: "Ödənişlərim", icon: Icons.payment);
  static const reciept = DrawerItem(title: "Reseptlərim", icon: Icons.receipt);
  static const reg =
      DrawerItem(title: "Qeydiyyat lar", icon: Icons.app_registration);
  static const priv =
      DrawerItem(title: "Məxvilik siyasəti", icon: Icons.privacy_tip);
  static const help = DrawerItem(title: "Yardım", icon: Icons.help);
  static const setting = DrawerItem(title: "Ayarlar", icon: Icons.settings);

  static final List<DrawerItem> all = [
    doctors,
    medInfo,
    payments,
    reciept,
    reg,
    priv,
    help,
    setting,
  ];
}

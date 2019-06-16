import 'package:kingscorer/utils/util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:kingscorer/custom_data_table.dart';
import 'package:kingscorer/ui/new_users_page.dart';
import 'package:kingscorer/tabbar/tab_bottom_menu.dart';

class Routes {
  static final Router _router = new Router();

  static var gameTableHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    // return new PlanetDetailPage(params["id"][0]);
    //return new CustomDataTable();
    return new TabBottomMenu();
  });

  static var newUserPageHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    if (getHandLength() > 0) {
      return new CustomDataTable();
    } else {
      return new NewUsersPage();
    }
  });

  static void initRoutes() {
    _router.define("/gametable", handler: gameTableHandler);
    _router.define("/newusers", handler: newUserPageHandler);
  }

  static void navigateTo(context, String path, {TransitionType transition}) {
    _router.navigateTo(context, path, transition: transition);
  }
}

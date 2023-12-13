import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zestypantry/app/modules/mainmenu/widgets/menu_tile.dart';

class MainMenuView extends GetView {
  const MainMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainMenuView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            // MenuTIle(title: "Grocery"),
            // MenuTIle(title: "Foods"),
          ],
        ),
      ),
    );
  }
}

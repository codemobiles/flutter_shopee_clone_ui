import 'package:flutter/material.dart';
import 'package:flutter_shopee_clone_ui/src/models/main_menu_model.dart';
import 'package:flutter_shopee_clone_ui/src/viewmodels/main_menu_view_model.dart';

class MainMenu extends StatelessWidget {
  final List<MainMenuModel> _menus = MainMenuViewModel().getMainMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, index) {
          final MainMenuModel menu = _menus[index];
          return Column(
            children: [
              Container(
                width: 45,
                height: 45,
                margin: EdgeInsets.only(bottom: 6),
                alignment: Alignment.center,
                child: FlatButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    side: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  onPressed: () {
                    //todo
                  },
                  child: Image.network(
                    menu.image,
                    color: menu.color,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                menu.title,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          );
        },
        itemCount: _menus.length,
      ),
    );
  }
}

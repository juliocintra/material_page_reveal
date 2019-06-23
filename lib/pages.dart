import 'package:flutter/material.dart';

final pages = [
  PageViewModel(
    const Color(0xFF678FB4),
    'assets/hotels.png',
    'Hotels',
    'All hotels and hostels are sorted by hospitality rating',
    'assets/key.png'
  ),
  PageViewModel(
      const Color(0xFF65B0B4),
      'assets/banks.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'assets/wallet.png'
  ),
  PageViewModel(
      const Color(0xFF9B90BC),
      'assets/stores.png',
      'Store',
      'All local stores are categorized for your convivence',
      'assets/shopping_cart.png'
  )
];

class Page extends StatelessWidget {

  final PageViewModel viewModel;
  final double percentVisible;

  Page({
    this.viewModel,
    this.percentVisible = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: viewModel.color,
      child: Opacity(
        opacity: percentVisible,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //                Image.asset('assets/hotels.png', width: 200, height: 200),
            Transform(
              transform: Matrix4.translationValues(0, 50 * (1 - percentVisible), 0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Image(
                  image: AssetImage(viewModel.heroAssetPath),
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0, 30 * (1 - percentVisible), 0),
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  viewModel.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'FlamanteRoma',
                      fontSize: 34),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0, 30 * (1 - percentVisible), 0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 75),
                child: Text(
                  viewModel.body,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetIcon;

  PageViewModel(this.color, this.heroAssetPath, this.title, this.body,
      this.iconAssetIcon);
}

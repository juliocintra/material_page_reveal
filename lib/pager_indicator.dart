import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_page_reveal/pages.dart';

class PagerIndicator extends StatelessWidget {

  final PageIndicatorViewModel viewModel;

  PagerIndicator({
    this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PageBubble(
              viewModel: PageBubbleViewModel(
                'assets/shopping_cart.png',
                Colors.green,
                false,
                0,
              ),
            ),
            PageBubble(
              viewModel: PageBubbleViewModel(
                'assets/shopping_cart.png',
                Colors.green,
                false,
                1,
              ),
            ),
            PageBubble(
              viewModel: PageBubbleViewModel(
                'assets/shopping_cart.png',
                Colors.green,
                true,
                0,
              ),
            ),
          ],
        )
      ],
    );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLetf
}

class PageIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PageIndicatorViewModel({
    this.pages,
    this.activeIndex,
    this.slideDirection,
    this.slidePercent
  });
}

class PageBubble extends StatelessWidget {

  final PageBubbleViewModel viewModel;

  PageBubble({
    this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: lerpDouble(20, 45, viewModel.activePercent),
        height: lerpDouble(20, 45, viewModel.activePercent),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.isHollow ? Colors.transparent : Color(0x88FFFFFF),
            border: Border.all(color: viewModel.isHollow ? Color(0x88FFFFFF) : Colors.transparent, width: 3)
        ),
        child: Opacity(
          opacity: viewModel.activePercent,
          child: Image.asset(
            viewModel.iconAssetPath,
            color: viewModel.color,
          ),
        ),
      ),
    );
  }
}

class PageBubbleViewModel {
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
    this.iconAssetPath,
    this.color,
    this.isHollow,
    this.activePercent
  );
}
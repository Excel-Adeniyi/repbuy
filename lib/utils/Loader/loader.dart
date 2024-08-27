import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeRotatingDots(
        color: const Color(0xff0a2417), size: 100);
  }
}

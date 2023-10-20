import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget customLoading() => LoadingAnimationWidget.flickr(
    leftDotColor: Colors.red, rightDotColor: Colors.black, size: 25);

Widget errorIcon() => Icon(
      Icons.image_not_supported,
      color: Colors.grey,
    );

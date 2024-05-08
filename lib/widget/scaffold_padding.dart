import 'package:flutter/material.dart';

class ScaffoldPadding extends Scaffold {
  ScaffoldPadding({
    super.key,
    body,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(horizontal: 16),
  }) : super(
          body: Padding(
            padding: contentPadding,
            child: body,
          ),
        );
}

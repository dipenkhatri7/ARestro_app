import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  final double size;
  final Widget child;
  final bool? isSettings;
  final double elevation;
  final double boarderRadius;
  const SettingsContainer(
      {Key? key,
      required this.size,
      required this.child,
      this.isSettings = false, required this.elevation, required this.boarderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: isSettings! ? null : EdgeInsets.symmetric(horizontal: 24.45),
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02,
        ),
        child: PhysicalModel(
          color: Colors.white,
          borderRadius: BorderRadius.circular(boarderRadius),
          elevation: elevation,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 4.45, vertical: 8.45),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * size,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

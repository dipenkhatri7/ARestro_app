import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class ProfileImage extends StatefulWidget {
  final double radius;
  final String images;
  bool? ispressed;
  ProfileImage({
    Key? key,
    required this.radius,
    required this.images,
    this.ispressed,
  }) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  // var counter = 0;
  // var timer = Timer.periodic(Duration(seconds: 1), (timer) {});
  // List<Color> get getColorsList => [
  //       const Color.fromARGB(255, 240, 0, 0),
  //       const Color.fromARGB(255, 4, 0, 240),
  //       const Color.fromARGB(255, 111, 255, 0),
  //       const Color.fromARGB(255, 255, 255, 0),
  //     ]..shuffle();

  /// Generate list of alignment which will be used to
  /// set gradient start and end for random color animation.
  // List<Alignment> get getAlignments => [
  //       Alignment.bottomLeft,
  //       Alignment.bottomRight,
  //       Alignment.topRight,
  //       Alignment.topLeft,
  //     ];
  // _startBgColorAnimationTimer() {
  //   ///Animating for the first time.
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     counter++;
  //     setState(() {});
  //   });

  //   const interval = Duration(seconds: 1);
  //   timer = Timer.periodic(interval, (timer) {
  //     counter++;
  //     setState(() {});
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _startBgColorAnimationTimer();
  // }

  // @override
  // void dispose() {
  //   timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: widget.radius < 20 ? widget.radius + 1 : widget.radius + 3,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          ),
        ),
        InkWell(
          onTap: () {
            widget.ispressed == true
                ? Navigator.pushNamed(context, '/profile')
                : null;
          },
          child: CircleAvatar(
            backgroundImage:
                widget.images == "" ? null : AssetImage(widget.images),
            radius: widget.radius,
            child: widget.images == ""
                ? Container(
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(
                          File(
                            widget.images,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

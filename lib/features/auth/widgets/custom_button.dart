import 'package:flutter/material.dart';
import 'package:arestro_app/constants/constant.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CustomButtom extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  AssetImage? image;
  final Color textColor;
  final double round;
  double? size;
  double? height;
  double? textSize;
  bool? isfavorite;

  CustomButtom(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.textColor,
      required this.round,
      this.image,
      this.size,
      this.height,
      this.textSize,
      this.isfavorite = false})
      : super(key: key);

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size == null
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * widget.size!,
      height: widget.height == null ? 48 : widget.height!,
      decoration: widget.text == "Skip"
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(widget.round),
              border: Border.all(
                color: widget.textColor,
              ),
            )
          : null,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 1.5,
          primary: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.round),
          ),
        ),
        child: widget.text == "Fingerprint"
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.fingerprint,
                    size: 20,
                  )
                ],
              )
            : widget.text == "Favourite"
                ? widget.isfavorite!
                    ? const Icon(Icons.favorite, size: 18)
                    : const Icon(
                        Icons.favorite_outline,
                        size: 18,
                      )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.image != null
                          ? Row(
                              children: [
                                Image(
                                  image: widget.image!,
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            )
                          : widget.text == "Fingerprint"
                              ? const Icon(
                                  Icons.fingerprint,
                                  size: 20,
                                )
                              : Container(),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      Text(
                        widget.text,
                        style: TextStyle(
                          fontFamily: 'AnekBangla',
                          fontSize: widget.textSize != null
                              ? widget.textSize
                              : widget.text == 'Buy Now'
                                  ? 13
                                  : 16,
                          color: widget.textColor,
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

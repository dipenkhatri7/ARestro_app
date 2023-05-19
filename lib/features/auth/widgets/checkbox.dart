import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? value;
  final bool isResponsive;
  final Color color;
  final Function(bool?) onSuccess;
  const CustomCheckbox({
    Key? key,
    this.value = false,
    this.isResponsive = false,
    this.color = Colors.white,
    required this.onSuccess,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        visualDensity: const VisualDensity(horizontal: 3, vertical: 3),
        side: const BorderSide(
          color: Colors.white,
        ),
        value: widget.isResponsive ? widget.value : true,
        onChanged: widget.onSuccess,
        activeColor: widget.color,
        checkColor: widget.isResponsive ? Colors.transparent : widget.color,
      ),
    );
  }
}

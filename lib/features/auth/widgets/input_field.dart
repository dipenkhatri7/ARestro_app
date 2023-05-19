import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
// import 'dart:io' show Platform;

class InputField extends StatefulWidget {
  final String? hint;
  final Icon icon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool isEmail;
  final bool isPassword;
  bool? isSamePassword;
  String? text;
  InputField(
      {Key? key,
      required this.hint,
      this.keyboardType,
      required this.controller,
      required this.isEmail,
      required this.icon,
      this.text,
      this.isSamePassword,
      required this.isPassword})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isValid = false;
  bool _isPasswordVisible = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _isPasswordVisible = false;
  //   widget.controller.addListener(() {
  //     _validateInput(widget.controller.text);
  //   });
  // }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _validateInput(String? value) {
    if (value != null) {
      setState(() {
        if (widget.isEmail) {
          _isValid =
              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
        } else if (widget.hint == 'Enter Your Password') {
          _isValid = RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
              .hasMatch(value);
        } else if (widget.hint == 'Confirm Your Password') {
          // Check if confirm password is same as password
          _isValid = widget.controller.text == widget.text;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.text == ""
            ? Container(
                height: 0,
                width: 0,
              )
            : Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.text!,
                  style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.2,
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          height: widget.keyboardType == TextInputType.phone
              ? MediaQuery.of(context).size.height * 0.065
              : MediaQuery.of(context).size.height * 0.058,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 251, 251, 251).withOpacity(0.95),
            border: Border.all(
                // width: 1.245,
                color: (widget.hint == 'Enter Your Password' &&
                        widget.controller.text.trim().isNotEmpty)
                    ? _isValid
                        ? Colors.green
                        : Colors.red
                    : widget.hint == "Confirm Your Password"
                        ? widget.isSamePassword!
                            ? Colors.green
                            : Colors.red
                        : Colors.grey),
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.keyboardType == TextInputType.phone
                ? false
                : (widget.isEmail)
                    ? false
                    : (widget.isPassword)
                        ? !_isPasswordVisible
                        : false,
            keyboardType: widget.keyboardType,
            textAlignVertical: TextAlignVertical.center,
            // decoration: widget.isEmail
            decoration: InputDecoration(
              prefixIcon: widget.keyboardType == TextInputType.phone
                  ? null
                  : widget.icon,
              hintText: widget.hint,
              prefixIconColor: Colors.grey,
              hintStyle: TextStyle(
                color: Color(0xff9C9C9C),
              ),
              border: InputBorder.none,
              suffixIcon: (widget.isEmail)
                  ? widget.controller.text.trim().isNotEmpty
                      ? _isValid
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.error,
                              color: Colors.yellow,
                            )
                      : null
                  : widget.isPassword == true
                      ? GestureDetector(
                          onTap: _togglePasswordVisibility,
                          child: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color:
                                _isPasswordVisible ? Colors.black : Colors.grey,
                          ),
                        )
                      : null,
            ),
            // :
            // InputDecoration(
            //     prefixIcon: widget.icon,
            //     prefixIconColor: Colors.grey,
            //     hintText: widget.hint,
            //     hintStyle: TextStyle(
            //       color: Color(0xff9C9C9C),
            //     ),
            //     border: InputBorder.none,
            //     suffixIcon:
            //   ),
            onChanged: _validateInput,
          ),
        ),
      ],
    );
  }
}

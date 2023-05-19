import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  static const String routeName = '/searchButton';
  final TextEditingController _searchController = TextEditingController();
  final double height;
  final Icon prefix;
  final Icon postfix;
  final String hintText;
  SearchButton({
    super.key,
    required TextEditingController searchController,
    required this.height,
    required this.prefix,
    required this.postfix,
    required this.hintText,
  });

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        controller: widget._searchController,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
            color: Color(0xff000000).withOpacity(0.38),
          ),
          prefixIcon: widget.prefix,
          suffixIcon: widget.postfix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xffD5D5D5),
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
    );
  }
}

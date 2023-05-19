import "package:arestro_app/constants/constant.dart";
import "package:flutter/material.dart";

class SettingsList extends StatefulWidget {
  final String title;
  final IconData icon;
  final IconData trailings;
  final GestureTapCallback onTap;
  final BuildContext context;

  const SettingsList({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.context,
    required this.trailings,
  }) : super(key: key);

  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  bool value = false;
  void onChanged(bool value) {
    setState(() {
      this.value = value;
    });
    if (value == true) {
      debugPrint("FingerPrint is on");
      // fingerPrint();
    } else {
      // removeFingerPrint();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18.45,
        backgroundColor: Colors.grey.withOpacity(0.2845),
        child: Opacity(
          opacity: 0.8,
          child: Icon(
            widget.icon,
            size: 20.45,
            color: GlobalVariable.primaryColor,
          ),
        ),
      ),
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 15,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w500,
          letterSpacing: 0.45,
        ),
      ),
      trailing: (widget.trailings == (Icons.abc))
          ? Switch(
              value: value,
              onChanged: onChanged,
              activeColor: GlobalVariable.primaryColor,
            )
          : Icon(
              widget.trailings,
              color: Colors.black,
              size: 18,
            ),
      onTap: widget.onTap,
    );
  }
}

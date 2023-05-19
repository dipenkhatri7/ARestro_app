import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/home/widgets/profileImage.dart';
import 'package:arestro_app/features/settings/widgets/settingsContainer.dart';
import 'package:arestro_app/features/settings/widgets/settingsList.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static const String routeName = '/settings';
  Settings({Key? key}) : super(key: key);
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 22.45,
              ),
              Padding(
                padding: EdgeInsets.only(left: 22.45, right: 22.45),
                child: InkWell(
                  onTap: () {},
                  child: PhysicalModel(
                    color: Colors.black,
                    shadowColor: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    elevation: 4.45,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.45),
                            child: ProfileImage(
                              radius: 30,
                              images: 'assets/images/me2.png',
                            ),
                          ),
                          const SizedBox(
                            width: 20.45,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dipen Khatri",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.8),
                              ),
                              const SizedBox(
                                height: 4.45,
                              ),
                              Text(
                                "Khatridipen7@gmail.com",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.45,
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.45),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SettingsContainer(
                elevation: 4.45,
                boarderRadius: 20,
                size: 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SettingsList(
                      context: context,
                      icon: Icons.lock,
                      title: 'Security & Privacy',
                      onTap: () {
                        // Navigator.pushNamed(context, Security.routeName);
                      },
                      trailings: Icons.arrow_forward_ios,
                    ),
                    SettingsList(
                      context: context,
                      icon: Icons.notifications,
                      title: 'Notifications',
                      onTap: () {},
                      trailings: Icons.abc,
                    ),
                    SettingsList(
                      context: context,
                      icon: Icons.help,
                      title: 'Help & Support',
                      onTap: () {
                        // Navigator.pushNamed(
                        //     context, HelpScreen.routeName);
                      },
                      trailings: Icons.arrow_forward_ios,
                    ),
                    SettingsList(
                      context: context,
                      icon: Icons.info,
                      title: 'About',
                      onTap: () {
                        // Navigator.pushNamed(context, About.routeName);
                      },
                      trailings: Icons.arrow_forward_ios,
                    ),
                    SettingsList(
                      context: context,
                      icon: Icons.logout,
                      title: 'Logout',
                      trailings: Icons.arrow_forward_ios,
                      onTap: () async {
                        // SharedPreferences prefs =
                        //     await SharedPreferences.getInstance();
                        // await prefs.clear();
                        // Navigator.pushNamedAndRemoveUntil(context,
                        //     AuthPage.routeName, (route) => false);
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
              SettingsContainer(
                elevation: 4.45,
                boarderRadius: 20,
                size: 0.1558,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SettingsList(
                      context: context,
                      icon: Icons.help,
                      title: 'Help & Support',
                      trailings: Icons.arrow_forward_ios,
                      onTap: () {
                        // Navigator.pushNamed(
                        //     context, HelpScreen.routeName);
                      },
                    ),
                    SettingsList(
                      context: context,
                      icon: Icons.info,
                      title: 'About',
                      trailings: Icons.arrow_forward_ios,
                      onTap: () {
                        // Navigator.pushNamed(
                        //     context, AboutScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

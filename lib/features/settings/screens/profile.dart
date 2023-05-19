import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/home/widgets/profileImage.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static const String routeName = '/profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isMember = true;
  @override
  Widget build(BuildContext context) {
    // final String imagePath =
    //     ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          'assets/images/Appbar.png',
          height: 38.45,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            tooltip: 'Notifications',
            onPressed: () {
              Navigator.pushNamed(context, '/Notifications');
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.0685,
        ),
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ProfileImage(
                    ispressed: false,
                    radius: 50,
                    images: 'assets/images/me2.png',
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.edit,
                          size: 21,
                          color: Colors.black,
                        ),
                      ),
                      // onPressed: () {},
                      // ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Personal Info',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 17),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                'Your Name',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              trailing: Text(
                                'Dipen Khatri',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Occupation',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              trailing: Text(
                                'Student',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Address',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              trailing: Text(
                                'Balkhu, Kathmandu',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Member',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              trailing: Switch(
                                  value: isMember,
                                  activeColor: GlobalVariable.primaryColor,
                                  onChanged: (value) {
                                    setState(() {
                                      isMember = !isMember;
                                    });
                                  }),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Contact Info',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              'Phone Number',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.5,
                                letterSpacing: 0.8,
                              ),
                            ),
                            trailing: Text(
                              '+977 9806534670',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.5,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Email',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.5,
                                letterSpacing: 0.8,
                              ),
                            ),
                            trailing: Text(
                              'Khatridipen7@gmail.com',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.5,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtom(
                text: 'Edit',
                onPressed: () {},
                color: GlobalVariable.primaryColor,
                textColor: Colors.white,
                round: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

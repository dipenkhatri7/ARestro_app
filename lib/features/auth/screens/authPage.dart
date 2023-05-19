// import 'package:arestro_app/constants/constant.dart';
// import 'package:arestro_app/features/auth/widgets/checkbox.dart';
// import 'package:arestro_app/features/auth/widgets/input_field.dart';
// import 'package:arestro_app/menu_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class AuthPage extends StatefulWidget {
//   static const routeName = '/authPage';
//   AuthPage({key}) : super(key: key);

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   int _currentIndex = 0;
//   final List<String> titles = ['Login', 'Register'];
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           color: GlobalVariable.primaryColor,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: GlobalVariable.primaryColor,
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/back.png'),
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//                 child: Center(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.4),
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     margin: EdgeInsets.symmetric(horizontal: 30.0),
//                     padding:
//                         EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image(
//                           image: AssetImage('assets/images/logo.png'),
//                           height: 80,
//                         ),
//                         Divider(),
//                         SizedBox(height: 4.0),
//                         CupertinoSegmentedControl<int>(
//                           borderColor: Colors.white,
//                           pressedColor: Colors.white,
//                           children: {
//                             0: _currentIndex == 0
//                                 ? Container(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 14.0,
//                                       vertical: 7.0,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.black.withOpacity(0.25),
//                                           spreadRadius: 2,
//                                           blurRadius: 5,
//                                           offset: Offset(0, 3),
//                                         ),
//                                       ],
//                                       border: Border.all(
//                                         color: GlobalVariable.primaryColor,
//                                       ),
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 16.0,
//                                         vertical: 8.0,
//                                       ),
//                                       child: Text(titles[0],
//                                           style: TextStyle(
//                                               color:
//                                                   GlobalVariable.primaryColor,
//                                               fontSize: 15.0)),
//                                     ),
//                                   )
//                                 : Container(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 14.0,
//                                       vertical: 7.0,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: GlobalVariable.primaryColor,
//                                       borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 16.0,
//                                         vertical: 8.0,
//                                       ),
//                                       child: Text(titles[0],
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 15.0)),
//                                     ),
//                                   ),
//                             1: _currentIndex == 1
//                                 ? Container(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 14.0,
//                                       vertical: 7.0,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.black.withOpacity(0.25),
//                                           spreadRadius: 2,
//                                           blurRadius: 5,
//                                           offset: Offset(0, 3),
//                                         ),
//                                       ],
//                                       border: Border.all(
//                                         color: GlobalVariable.primaryColor,
//                                       ),
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 16.0,
//                                         vertical: 8.0,
//                                       ),
//                                       child: Text(titles[1],
//                                           style: TextStyle(
//                                               color:
//                                                   GlobalVariable.primaryColor,
//                                               fontSize: 15.0)),
//                                     ),
//                                   )
//                                 : Container(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 14.0,
//                                       vertical: 7.0,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: GlobalVariable.primaryColor,
//                                       borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 16.0,
//                                         vertical: 8.0,
//                                       ),
//                                       child: Text(
//                                         titles[1],
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 15.0),
//                                       ),
//                                     ),
//                                   ),
//                           },
//                           onValueChanged: (int value) {
//                             setState(() {
//                               _currentIndex = value;
//                             });
//                           },
//                           groupValue: _currentIndex,
//                           selectedColor: Colors.white,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (_currentIndex == 0) ...[
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Color.fromARGB(255, 0, 0, 0),
//                     ),
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30)),
//                     color: Colors.white,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         'Email Address',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       InputField(
//                         icon: Icon(Icons.email),
//                         hint: 'Enter Your Email',
//                         isPassword: false,
//                         isEmail: true,
//                         controller: _emailController,
//                       ),

//                       Text(
//                         'Password',
//                         style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//                       ),
//                       // const SizedBox(
//                       //   height: 10,
//                       // ),

//                       InputField(
//                         isPassword: true,
//                         icon: Icon(Icons.lock_outline_rounded),
//                         hint: 'Enter Your Password',
//                         isEmail: false,
//                         controller: _passwordController,
//                       ),
//                       // Container(
//                       //   width: double.infinity,
//                       //   height: MediaQuery.of(context).size.height * 0.055,
//                       //   decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(30),
//                       //     color: Color.fromARGB(255, 251, 251, 251)
//                       //         .withOpacity(0.95),
//                       //     border: Border.all(
//                       //       color: Color.fromARGB(255, 0, 0, 0),
//                       //     ),
//                       //   ),
//                       //   child: TextFormField(
//                       //     decoration: InputDecoration(
//                       //       hintText: "Enter Your Password",
//                       //       prefixIcon: Icon(Icons.lock),
//                       //       border: InputBorder.none,
//                       //       suffixIcon: Icon(Icons.visibility_off_outlined),
//                       //     ),
//                       //   ),
//                       // ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               CustomCheckbox(
//                                 isResponsive: true,
//                                 value: false,
//                                 color: GlobalVariable.primaryColor,
//                               ),
//                               const SizedBox(width: 10),
//                               Text(
//                                 'Stay logged in',
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             ],
//                           ),
//                           TextButton(
//                             onPressed: () {},
//                             child: Text(
//                               'Forgot password?',
//                               style:
//                                   TextStyle(color: GlobalVariable.primaryColor),
//                             ),
//                           ),
//                         ],
//                       ),

//                       Container(
//                         width: double.infinity,
//                         height: MediaQuery.of(context).size.height * 0.055,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: GlobalVariable.primaryColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => MenuScreen()));
//                           },
//                           child: Text('Login'),
//                         ),
//                       ),

//                       const Divider(
//                         color: Colors.black,
//                         thickness: 1,
//                       ),

//                       Center(
//                         child: Text('Sign in with social media',
//                             style: TextStyle(color: Colors.black)),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {},
//                             child: Row(
//                               children: [
//                                 Image(
//                                   image: AssetImage('assets/images/google.png'),
//                                   height: 20,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           ElevatedButton(
//                             onPressed: () {},
//                             child: Row(
//                               children: [
//                                 Image(
//                                   image: AssetImage('assets/images/apple.png'),
//                                   height: 20,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           ElevatedButton(
//                             onPressed: () {},
//                             child: Row(
//                               children: [
//                                 Image(
//                                   image:
//                                       AssetImage('assets/images/facebook.png'),
//                                   height: 20,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ] else ...[
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   padding: EdgeInsets.all(14),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Color.fromARGB(255, 0, 0, 0),
//                     ),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                     color: Colors.white,
//                   ),
//                   child: Form(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 10),
//                         Text('Full Name'),
//                         const SizedBox(height: 10),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Color.fromARGB(255, 255, 254, 254)
//                                 .withOpacity(0.95),
//                             border: Border.all(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                           ),
//                           child: TextFormField(
//                             controller: _emailController,
//                             decoration: InputDecoration(
//                               hintText: "Enter Your Full Name",
//                               prefixIcon: Icon(Icons.person),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text('Email Address'),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Color.fromARGB(255, 255, 254, 254)
//                                 .withOpacity(0.95),
//                             border: Border.all(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                           ),
//                           child: TextFormField(
//                             controller: _emailController,
//                             decoration: InputDecoration(
//                               hintText: "Enter Your Email",
//                               prefixIcon: Icon(Icons.email),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text('Password'),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Color.fromARGB(255, 255, 254, 254)
//                                 .withOpacity(0.95),
//                             border: Border.all(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                           ),
//                           child: TextFormField(
//                             controller: _passwordController,
//                             decoration: InputDecoration(
//                               hintText: "Enter Your Password",
//                               prefixIcon: Icon(Icons.lock),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text('Confirm Password'),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Color.fromARGB(255, 255, 254, 254)
//                                 .withOpacity(0.95),
//                             border: Border.all(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                           ),
//                           child: TextFormField(
//                             controller: _passwordController,
//                             decoration: InputDecoration(
//                               hintText: "Confirm Your Password",
//                               prefixIcon: Icon(Icons.lock),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Text('Register'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ]
//           ],
//         ),
//       ),
//     );
//   }
// }

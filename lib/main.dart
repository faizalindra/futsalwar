import 'package:flutter/material.dart';
import 'package:futsalwar/ui/login_page.dart';
// import 'package:futsalwar/ui/registrasi_page.dart';
// import 'package:futsalwar/ui/booking_form.dart';
// import 'package:futsalwar/ui/booking_detail.dart';
import 'package:futsalwar/ui/booking_page.dart';
import 'package:futsalwar/helpers/user_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//   Widget page = CircularProgressIndicator();

//   @override
//   void initState() {
//     super.initState();
//     isLogin();
//   }

//   void isLogin() async {
//     var token = await UserInfo().getToken();
//     if (token != null) {
//       setState(() {
//         page = BookingPage();
//       });
//     } else {
//       setState(() {
//         page = LoginPage();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Toko Kita',
//       debugShowCheckedModeBanner: false,
//       home: page,
//     );
//   }
// } //end class _MyAppState

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookingPage(),
    );
  }
}

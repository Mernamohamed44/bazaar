import 'package:bazzar/modules/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(
        const Duration(
          milliseconds: 5000,
        ),
            () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/splash.png', width: 150,
              height: 150,),
            Text('b a z a a r',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color:Colors.red,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ))),
             Text('Easier Than You Think',style: GoogleFonts.poppins(
                 textStyle: TextStyle(
                     fontSize: 20,
                   color: Colors.grey
                 )))
          ],
        ),
      ) ,
    );
  }
}
//'https://th.bing.com/th/id/R.dcf1dfedbec35b1239e0ad7d82854fc4?rik=XGe8MhUrPLgbnQ&riu=http%3a%2f%2fwww.agilx.com%2fwp-content%2fuploads%2f2011%2f03%2fshopping_bag.png&ehk=oEpWyakmLQc%2bS027o6ZO%2bO74fzr7xNw8qO4x30wAhpc%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1'
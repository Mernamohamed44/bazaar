import 'package:flutter/material.dart';

import '../shared/themes.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon:Icon(Icons.arrow_back,color:Colors.grey.withOpacity(.5) ,),
    onPressed:() => Navigator.pop(context)),
          backgroundColor: CommonMethod().themeData.appBarTheme.backgroundColor,
        title:  Text('About App',style: CommonMethod().themeData.textTheme.bodyText1),),
      body: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Bazaar is the app behind the scenes online store where people can get all essential product',style: CommonMethod().themeData.textTheme.bodyText1),
      )),
    );
  }
}

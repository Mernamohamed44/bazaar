import 'package:flutter/material.dart';

import '../style/themes.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bazaar is the app behind the scenes online store where people can get all essential product',style: CommonMethod().themeData.textTheme.bodyText1)
            ,SizedBox(height: 10,),
            Text('Project made by : Merna Mohamed Elseady',style: CommonMethod().themeData.textTheme.bodyText1?.copyWith(
              fontSize: 13
            ))
          ],
        ),
      ),
    );
  }
}

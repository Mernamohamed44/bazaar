import 'package:bazzar/cubit/cubit.dart';
import 'package:bazzar/style/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/state.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (BuildContext context)=>BazaarCubit(context),
     child: BlocConsumer<BazaarCubit,BazaarStates>(
       listener: (context,state){},
       builder: (context,state){
         var cubit=BazaarCubit.get(context);
         return Scaffold(
           backgroundColor: Colors.grey.shade100,
           body: cubit.screens[cubit.currentIndex] ,
           bottomNavigationBar: BottomNavigationBar(
             elevation: 4,
             selectedItemColor:CommonMethod().themeData.bottomNavigationBarTheme.selectedItemColor ,
             unselectedItemColor: CommonMethod().themeData.bottomNavigationBarTheme.unselectedItemColor,
             unselectedLabelStyle: CommonMethod().themeData.bottomNavigationBarTheme.unselectedLabelStyle,
             showUnselectedLabels: true,
             items: cubit.bottomNav,
             currentIndex: cubit.currentIndex,
             onTap: (index){
                   cubit.changeBottomNave(index);
             },
           ),
         );
       },
     ),
   );
  }
}
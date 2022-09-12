import 'package:bazzar/cubit/state.dart';
import 'package:bazzar/models/users_model.dart';
import 'package:bazzar/style/themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/cubit.dart';
import '../shared/component/component.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>BazaarCubit(context)..readUser(),
      child: BlocConsumer<BazaarCubit,BazaarStates>(
        listener: (context,state)=>{},
        builder: (context,state){
          var userModel=BazaarCubit.get(context).userModel;
          print(userModel?.email);
          return Scaffold(
              backgroundColor: CommonMethod().themeData.primaryColor,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Account',style:CommonMethod().themeData.textTheme.bodyText2?.copyWith(
                              height:3,
                              fontSize: 35
                          ) ,),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage('${userModel?.image}'),
                                radius:30 ,
                              ),
                              SizedBox(width: 15,),
                              Column(
                                children: [
                                  Text('${userModel?.name}',style:CommonMethod().themeData.textTheme.bodyText2?.copyWith(
                                      fontSize:15,
                                      textBaseline: TextBaseline.ideographic,

                                      overflow: TextOverflow.clip
                                  ) ),
                                  Text('${userModel?.email}',style:CommonMethod().themeData.textTheme.bodyText2?.copyWith(
                                      fontSize:15
                                  ) ),
                                ],
                              ),
                              SizedBox(width: 90,),
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: 18,
                                child:Icon(Icons.mode_edit_outlined),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: 370,
                            height: 270,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              color: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  buildAccountItem('Shipping Address',Icons.location_on_outlined),
                                  buildAccountItem('Payment Method',Icons.payment),
                                  buildAccountItem('Order History',Icons.list),
                                  buildAccountItem('Delivery Status',Icons.delivery_dining_outlined),
                                  buildAccountItem('Languages',Icons.language_outlined),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 370,
                            height: 270,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              color: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  buildAccountItem('Favorite',Icons.heart_broken_outlined),
                                  buildAccountItem('Privacy Policy',Icons.lock_outline),
                                  buildAccountItem('Frequently Asked Question',Icons.question_mark_outlined),
                                  buildAccountItem('Delivery Status',Icons.delivery_dining_outlined),
                                  buildAccountItem('Rate Our App',Icons.star_border_outlined),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout_outlined),
                              Text('LogOut',style:CommonMethod().themeData.textTheme.bodyText1 ,)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}

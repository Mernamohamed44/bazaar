import 'package:bazzar/cubit/cubit.dart';
import 'package:bazzar/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/state.dart';
import '../style/themes.dart';

class CategoriesScreen extends StatefulWidget {
 const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (BuildContext context)=>BazaarCubit(context)..getNamesCat1()..getNamesCat2()..getNamesCat3()..getNamesCat4()..getNamesCat5()..getNamesCat6()..getNamesCat7(),
     child: BlocConsumer<BazaarCubit,BazaarStates>(
       listener: (BuildContext context, state) {},
       builder: (BuildContext context, Object? state) {
         var cubit =BazaarCubit.get(context);
         var model2=cubit.model2;
         var model3=cubit.model3;
         var model4=cubit.model4;
         var model5=cubit.model5;
         var model6=cubit.model6;
         var model7=cubit.model7;
         var model8=cubit.model8;
         List<String> catName = [
           '${model2?.name}',
           '${model3?.name}',
           '${model4?.name}',
           '${model5?.name}',
           '${model6?.name}',
          '${model7?.name}',
           '${model8?.name}',
         ];
         List<String> catPhotos = [
           '${model2?.image}',
           '${model3?.image}',
           '${model4?.image}',
           '${model5?.image}',
           '${model6?.image}',
           '${model7?.image}',
           '${model8?.image}',
         ];
         return Scaffold(
         body: SafeArea(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     IconButton(
                       icon: Icon(
                         Icons.arrow_back_ios,
                         color: Colors.grey.withOpacity(.5),
                         size: 27,
                       ),
                       onPressed: () {
                         Navigator.pop(context);
                       },
                     ),
                     IconButton(
                       icon: Icon(
                         Icons.search_sharp,
                         color: Colors.grey.withOpacity(.5),
                         size: 30,
                       ),
                       onPressed: () {},
                     ),
                     const SizedBox(
                       width: 230,
                     ),
                     IconButton(
                         onPressed: () {},
                         icon: Icon(Icons.notifications_none_outlined,
                             color: Colors.grey.withOpacity(.5), size: 30))
                   ],
                 ),
                 Text('All Categories',
                     style: CommonMethod().themeData.textTheme.bodyText1),
                 const SizedBox(
                   height: 20,
                 ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.separated(
                                itemBuilder:(context,index)=> buildContainerCate(catPhotos[index],catName[index]),
                                separatorBuilder:  (context,index)=>const SizedBox(height: 10,),
                                itemCount:4),),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ListView.separated(
                                itemBuilder:(context,index)=> buildContainerCate(catPhotos[index+4],catName[index+4]),
                                separatorBuilder:  (context,index)=>const SizedBox(height: 10,),
                                itemCount:3),),
                        ],
                      ),
                    ),
                  ),
               ],
             ),
           ),
         ),
       );  },

     ),
   );
  }
}

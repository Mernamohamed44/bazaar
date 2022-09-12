import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../layout/categories_layout.dart';
import '../shared/component/component.dart';
import '../style/themes.dart';
import 'about_app.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>BazaarCubit(context)..getDataCat1()..getDataCat2()..getDataCat3()..getNamesCat1()..getNamesCat2()..getNamesCat3()..getNamesCat4(),
      child: BlocConsumer<BazaarCubit, BazaarStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = BazaarCubit.get(context);
          var model=cubit.model;
          var model1=cubit.model1;
          var modelData=cubit.modelData;
          var model2=cubit.model2;
          var model3=cubit.model3;
          var model4=cubit.model4;
          var model5=cubit.model5;

          List<String> catName = [
            '${model2?.name}',
            '${model3?.name}',
            '${model4?.name}',
            '${model5?.name}'
          ];
          List<String> catPhotos = [
            '${model2?.image}',
            '${model3?.image}',
            '${model4?.image}',
            '${model5?.image}',
          ];

              return Scaffold(
               appBar: AppBar(
                 elevation: .8,
                 backgroundColor: CommonMethod().themeData.appBarTheme.backgroundColor,
                 leading: IconButton(icon: Icon(Icons.search_sharp,color: Colors.grey.withOpacity(.5),size: 30,),onPressed: (){},),
                 actions: [
                   IconButton(onPressed: (){}, icon:Icon(Icons.notifications_none_outlined,color: Colors.grey.withOpacity(.5),size: 30)),
                   IconButton(onPressed: (){
                     navigateTo(context, AboutApp());
                   }, icon:Icon(Icons.info_outline,color: Colors.grey.withOpacity(.5),size: 30)),
                 ],
               ),
               body: SingleChildScrollView(
                 child: Column(
                   children: [
                     buildFirstWeigt(),
                     SizedBox(
                       height: 15,
                     ),
                     Container(
                       padding: EdgeInsets.only(left: 8),
                       width: 400,
                       height: 270,
                       color: Colors.white,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             children: [
                               Text('Exclusive deals',
                                   style:
                                   CommonMethod().themeData.textTheme.bodyText1),
                               SizedBox(
                                 width: 150,
                               ),
                               Text('Views all',
                                   style:
                                   CommonMethod().themeData.textTheme.headline1),
                             ],
                           ),
                           SingleChildScrollView(
                             scrollDirection: Axis.horizontal,
                             child: Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 buildItemExclusive(
                                     '${model?.image}',
                                     '${model?.priceAfter}',
                                     '${model?.priceBefore}',
                                     '${model?.name}'),
                                 buildItemExclusive(
                                     '${model1?.image}',
                                     '${model1?.priceAfter}',
                                     '${model1?.priceBefore}',
                                     '${model1?.name}'),
                               buildItemExclusive(
                                     '${modelData?.image}',
                                     '${modelData?.priceAfter}',
                                     '${modelData?.priceBefore}',
                                     '${modelData?.name}')
                               ],
                             ),
                           )
                         ],
                       ),
                     ),
                     SizedBox(
                       height: 15,
                     ),
                     Container(
                       padding: EdgeInsets.only(left: 8),
                       width: 400,
                       height: 300,
                       color: Colors.white,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             children: [
                               Text('Categories',
                                   style:
                                   CommonMethod().themeData.textTheme.bodyText1),
                               SizedBox(
                                 width: 190,
                               ),
                               InkWell(
                                 onTap: () => navigateTo(context, CategoriesScreen()),
                                 child: Text('Views all',
                                     style:
                                     CommonMethod().themeData.textTheme.headline1),
                               ),
                             ],
                           ),
                           Container(
                             height: 100,
                             child: ListView.separated(
                                 scrollDirection: Axis.horizontal,
                                 shrinkWrap: true,
                                 itemBuilder: (context, index) =>
                                     buildContainerCate(catPhotos[index], catName[index]),
                                 separatorBuilder: (context, index) => SizedBox(
                                   width: 10,
                                 ),
                                 itemCount: catPhotos.length),
                           )
                         ],
                       ),
                     ),

                   ],
                 ),
               ),
            );
        },
      ),
    );
  }
}

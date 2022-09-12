
import 'package:bazzar/style/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildButton(String txt, color, txtColor, fun,height,width) {
  return Container(
    height:height,
    width: width,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: TextButton(
      onPressed: fun,
      child: Text(
        txt,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: txtColor, fontSize: 15, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}
 void navigateTo(context, w){
    Navigator.push(context,MaterialPageRoute(
        builder: (context){
      return w;
    }));
  }
  Widget buildTextField(controller,txt,icon,{IconData? suffix,Function? onpress,isPass=false}){
  return TextFormField(
    obscureText: isPass?true:false,
    controller: controller,
    validator: (String? value) {
      if (value!.isEmpty) {
        return '$txt must not null';
      }
      else if(value.length <5){
        return"Password is too short";
      }
      return null;
    },
    decoration: InputDecoration(
      enabled:  true,
        label: Text(
          '$txt',
          style: TextStyle(color: Colors.white),
        ),
        suffixIcon:IconButton(
          onPressed:(){
            if(suffix!=null){
              onpress!();
            }
            else{
              {}
            }
          }
           ,
          icon: Icon(suffix),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        )),
  );

  }
  buildContainerSale(image){
  return Stack(children: [
    Container(
      width: 350,
      height: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(
                  image),
              fit: BoxFit.cover)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 170,
              height: 90,
              child: Text(
                'Super Flash Sale 50% Off',
                style: CommonMethod()
                    .themeData
                    .textTheme
                    .bodyText2,
              )),
          SizedBox(
            height: 15,
          ),
          buildButton(
              'See More',
              Colors.white,
              CommonMethod()
                  .themeData
                  .textTheme
                  .bodyText1
                  ?.color,
                  () {},
              40.0,
              100.0)
        ],
      ),
    )
  ]);
  }
  buildContainerCate(image,txt){
   return Container(
     width: 100,
     decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: Colors.blue.shade50
     ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Image.asset(image,height:70,width: 70, ),
         Text(txt),
       ],
     ),
   );
  }
  buildItemExclusive(image , priceAftar,pricePefore ,title ){
  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
        Border.all(width: 2.0, color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                image: DecorationImage(
                    image: NetworkImage(
                        image),
                    fit: BoxFit.cover)),
          ),
          Row(
            children: [
              Text(priceAftar,
                  style: CommonMethod()
                      .themeData
                      .textTheme
                      .headline1),
              SizedBox(
                width: 20,
              ),
              Text(
                pricePefore,
                style: TextStyle(
                    color: CommonMethod()
                        .themeData
                        .primaryColor,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          ),
          Text(
            title,
            style: CommonMethod()
                .themeData
                .textTheme
                .headline1,
          ),
          Container(
            height: 40,
            width: 130,
            decoration:
            BoxDecoration(color:CommonMethod().themeData.primaryColor, borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)))
            ,child: TextButton(
              onPressed: () {},
              child: Text('Add to Cart',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)))),
          )
        ],
      ),
    ),
  );
  }
 buildAccountItem(title,icon)
 {
  return Container(
    height: 50,
    child: ListTile(
      subtitle: Divider(
        thickness: 1,
        endIndent: 70,),
    title: Text(title,style: GoogleFonts.poppins(),),
    leading: Icon(icon,color: CommonMethod().themeData.primaryColor,),

      ),
  );
 }
 buildFirstWeigt()
 {
  return    Container(
    height: 230,
    padding: EdgeInsets.only(left: 8),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New arrival',
          style: CommonMethod().themeData.textTheme.bodyText1,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildContainerSale(
                  'https://assets.bigcartel.com/product_images/248098211/IMG_4730.JPG?auto=format&fit=max&w=1540'),
              SizedBox(
                width: 10,
              ),
              buildContainerSale(
                  'https://th.bing.com/th/id/OIP.Jsml4BXabt2LG046r_Hn_AAAAA?w=187&h=187&c=7&r=0&o=5&dpr=1.5&pid=1.7'),
            ],
          ),
        )
      ],
    ),
  );
 }
import 'package:bazzar/cubit/state.dart';
import 'package:bazzar/models/data_model.dart';
import 'package:bazzar/models/users_model.dart';

import 'package:bazzar/modules/account_screen.dart';
import 'package:bazzar/modules/charts_screen.dart';
import 'package:bazzar/modules/chats_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/home_screen.dart';

class BazaarCubit extends Cubit<BazaarStates> {
  BazaarCubit(BuildContext context) : super(InitialState());
  static BazaarCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isShow = false;
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomNav = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline_outlined), label: 'Chats'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: 'Charts'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline), label: 'account'),
  ];
  List<Widget> screens = [
    const Home(),
    const ChatsScreen(),
    const ChartsScreen(),
    const AccountScreen()
  ];
  changeBottomNave(index) {
    currentIndex = index;
    emit(BottomNavState());
  }


   signUp() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text).then((value) => {
         createUser(value.user!.uid),
        emit(SignUpState()),
    });
  }
  signIn() {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text).
    then((value) => {
    emit(LoginState())
    });


  }
  createUser(String uId)
  {
    UserModel model=UserModel(
        email: emailController.text,
        name: nameController.text,
        phone: phoneController.text,
        uId: uId,
        image: 'https://th.bing.com/th/id/OIP.qq0pMkKMcFo0iqqo9m_OTwHaKo?pid=ImgDet&w=500&h=718&rs=1'

    );
    FirebaseFirestore.instance.collection('users').doc('id').
    set(model.toMap()).then((value) => {
    emit(CreateUserState())
    });
  }
  UserModel?userModel;
  Future<UserModel?> readUser() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc('id')
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessState());
      if (kDebugMode) {
        print(userModel?.name);
      }
      if (kDebugMode) {
        print(value.data());
      }
      return userModel;
    });
  }
  DataModel? model;
  void getDataCat1() {
    emit(GetDataCatLoadingState());
    FirebaseFirestore.instance.collection('Categories').doc(
        'dataCategory1').get().then((value) {
      model = DataModel.fromJson(value.data()!);
      print(value.data());
      emit(GetDataCatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDataCatErrorState(error.toString()));
    });
  }
  DataModel? model1;
  void getDataCat2() {
    emit(GetDataCatLoadingState());
    FirebaseFirestore.instance.collection('Categories').doc(
        'dataCategory2').get().then((value) {
      model1 = DataModel.fromJson(value.data()!);
      print(value.data());
      emit(GetDataCatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDataCatErrorState(error.toString()));
    });
  }
  DataModel? modelData;
  void getDataCat3() {
    emit(GetDataCatLoadingState());
    FirebaseFirestore.instance.collection('Categories').doc(
        'dataCategory3').get().then((value) {
      modelData = DataModel.fromJson(value.data()!);
      print(value.data());
      emit(GetDataCatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDataCatErrorState(error.toString()));
    });
  }
  DataModel? model2;
  void getNamesCat1() {
    emit(GetNamesCatLoadingState());
    FirebaseFirestore.instance.collection('categoryNames').doc(
        'name1').get().then((value) {
      model2 = DataModel.fromJson(value.data()!);
      print(value.data());
      emit(GetNamesCatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNamesCatErrorState(error.toString()));
    });
  }DataModel? model3;
  void getNamesCat2() {
    emit(GetNamesCatLoadingState());
    FirebaseFirestore.instance.collection('categoryNames').doc(
        'name2').get().then((value) {
      model3 = DataModel.fromJson(value.data()!);
      print(value.data());
      emit(GetNamesCatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNamesCatErrorState(error.toString()));
    });
  }
  DataModel? model4;
  void getNamesCat3() {
    emit(GetNamesCatLoadingState());
    FirebaseFirestore.instance.collection('categoryNames').doc(
        'name3').get().then((value) {
      model4 = DataModel.fromJson(value.data()!);
      print(value.data());
      emit(GetNamesCatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNamesCatErrorState(error.toString()));
    });
  }
  DataModel? model5;
  void getNamesCat4() {
    emit(GetNamesCatLoadingState());
    FirebaseFirestore.instance.collection('categoryNames').doc(
        'name4').get().then((value) {
      model5 = DataModel.fromJson(value.data()!);
      print(value.data());
      emit(GetNamesCatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNamesCatErrorState(error.toString()));
    });
  }
  DataModel? model6;
  void getNamesCat5() {
    emit(GetNamesCatLoadingState());
    FirebaseFirestore.instance.collection('categoryNames').doc(
        'name5').get().then((value) {
      model6 = DataModel.fromJson(value.data()!);
      print(value.data());
      emit(GetNamesCatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNamesCatErrorState(error.toString()));
    });
  }
  DataModel? model7;
  void getNamesCat6() {
    emit(GetNamesCatLoadingState());
    FirebaseFirestore.instance.collection('categoryNames').doc(
        'name6').get().then((value) {
      model7 = DataModel.fromJson(value.data()!);
      print(value.data());
      emit(GetNamesCatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNamesCatErrorState(error.toString()));
    });
  }
  DataModel? model8;
  void getNamesCat7() {
    emit(GetNamesCatLoadingState());
    FirebaseFirestore.instance.collection('categoryNames').doc(
        'name7').get().then((value) {
      model8 = DataModel.fromJson(value.data()!);
      print(value.data());
      emit(GetNamesCatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNamesCatErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(SocialRegistervisiblepassState());
  }


}

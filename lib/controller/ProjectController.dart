import 'dart:convert';
import 'dart:developer';
import 'package:aplikasi_magang/network/api.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var data_array = [].obs;
  var selectedList = [].obs;
    var onShow = true.obs;


  @override
  void onInit() {
    getProject();
    super.onInit();
  }
    Future<void> checking_array(index) async{
          //  inspect(selectedList);

  //  inspect(index);
    if(selectedList.contains(index)){
      for(var i =0; i < selectedList.length; i++){
       selectedList.removeWhere((element) => element == index);
      }
      inspect(selectedList);
    }else{
      selectedList.add(index);
     inspect(selectedList);
    }
   }
  

  getProject() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    final id_magang = localStorage.getString('id_magang');
    final token = localStorage.getString('token');
    var data = {'id_magang': id_magang , 'token': token};
     var res = await Api().auth(data, 'Task');
    // var uri = 'Desa/Keluhan?id_warga=' + id.replaceAll('"', '');
    // var res = await Api().get(uri.toString());

    var body = json.decode(res.body);
    data_array.value = body;
    inspect(data_array);
    inspect('tes');

  }
  Future<void> submit(BuildContext context) async{
          //  inspect(selectedList);

  //  inspect(index);
      SharedPreferences localStorage = await SharedPreferences.getInstance();

    final id_magang = localStorage.getString('id_magang');
    final token = localStorage.getString('token');
    var data = {'id_magang': id_magang , 'token': token, 'task_all':selectedList.toString()};
     var res = await Api().auth(data, 'Task/Project');
         var body = json.decode(res.body);
         inspect(body);
         selectedList.clear();
         getProject();
          var snackBar = const SnackBar(
        content: Text('Data Sukses Di Update'),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
         

   }

}
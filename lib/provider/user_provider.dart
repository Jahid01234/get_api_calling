import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../data_calling/data_call.dart';
import '../model/user_model.dart';

class UserProvider extends ChangeNotifier{


  bool isLoading = false;

   List<UserModel> _userList = [];
   List<UserModel> get allUserList => _userList;

   void fetchPost() async{
     isLoading = true;
     try{
       DataCalling dataCalling = DataCalling();
       _userList = await dataCalling.getData();

       isLoading = false;

     }catch(e){
       isLoading = false;
     }
     notifyListeners();
   }

}
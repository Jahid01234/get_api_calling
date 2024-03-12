import 'package:flutter/material.dart';
import 'package:get_api_calling/provider/user_provider.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.read<UserProvider>().fetchPost();
  }


  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Get Api Calling by Provider",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),

      body:Padding(
        padding: EdgeInsets.all(10),

               // true part
        child: userProvider.isLoading==true ? Center(child: CircularProgressIndicator())
           // false part
            : ListView.builder(itemBuilder: (context, itemIndex)
        {
          return ListTile
            (

            leading: CircleAvatar(child: Text(userProvider.allUserList[itemIndex].id.toString())),
            title: Text(userProvider.allUserList[itemIndex].name.toString()),
            subtitle: Text(userProvider.allUserList[itemIndex].email.toString()),

           );
        },
          itemCount: userProvider.allUserList.length,
        ),
      ),
    );
  }
}

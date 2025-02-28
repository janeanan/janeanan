
import 'package:flutter/material.dart';
import 'package:janeanan/component/card_list_user_shimmer_load.dart';
import 'package:janeanan/data/enum.dart';
import 'package:janeanan/domain/list_user_view_model.dart';
import 'package:janeanan/extension/space_extension.dart';


import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late UserListModel viewModel;

  TextEditingController numUser = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = Provider.of<UserListModel>(context, listen: false);
    viewModel.getListUser('5');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: _body(),
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  _body() {
    return Consumer<UserListModel>(builder: (context, value, child) {
      if (value.statusListUser == ConnectionStatus.none ||
          value.statusListUser == ConnectionStatus.loading) {
        return CardShimmer();
      } else if (value.statusListUser == ConnectionStatus.success) {
        var userList = value.responseListUser.results;
        return ListView.separated(
            itemCount: userList!.length,
            itemBuilder: (buildContext, index) {
              var title = userList[index].name!.title.toString();
              var name = userList[index].name!.first.toString();
              var last = userList[index].name!.last.toString();
              var email = userList[index].email.toString();

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          userList[index].picture!.medium.toString(),
                        ),
                      ),
                      5.sBoxHeight,
                      Text('$title $name $last'),
                      Text('Email : $email'),
                      Text('Country : $email'),
                      Text('City : $email'),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ));
      } else {
        return Text('Error');
      }
    });
  }

  _bottomAppBar() => BottomAppBar(
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: TextFormField(
                        controller: numUser,
                        keyboardType: const TextInputType.numberWithOptions(),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () async {
                            await viewModel.getListUser(numUser.text);
                            Navigator.of(context).pop();
                          },
                          child: const Text("Confirm"),
                        )
                      ],
                    );
                  });
            },
            child: const Text('Enter the number of people')),
      );
}

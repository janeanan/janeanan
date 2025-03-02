import 'package:flutter/material.dart';
import 'package:janeanan/data/enum.dart';
import 'package:janeanan/domain/list_laptop_view_model.dart';
import 'package:provider/provider.dart';

class EComPage extends StatefulWidget {
  const EComPage({super.key});

  @override
  State<EComPage> createState() => _EComPageState();
}

class _EComPageState extends State<EComPage> {
  late LaptopListModel viewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = Provider.of<LaptopListModel>(context, listen: false);
    viewModel.getListLaptops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Consumer<LaptopListModel>(
              builder: (context, value, child) {
                if (value.statusListLaptop == ConnectionStatus.none ||
                    value.statusListLaptop == ConnectionStatus.loading) {
                  return Text('Load');
                } else if (value.statusListLaptop == ConnectionStatus.success) {
                  var datas = value.responseListLaptop.products;
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: datas!.length,
                    itemBuilder: (context, index) {
                      var img = datas[index].images![0].toString();
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                              imageProduct(img),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Text('Error');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  imageProduct(img) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
      ),
    );
  }
}

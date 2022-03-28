import 'package:flutter/material.dart';
import 'package:flutter_first/models/catalog.dart';
import 'package:flutter_first/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/catalog.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var url = "https://jsonplaceholder.typicode.com/photos";

  // ignore: prefer_typing_uninitialized_variables
  var data, size, height, width;
  // List<dynamic> list = [];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Future.delayed(const Duration(seconds: 5));
    // print('list $list');
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    CatalogModels.items =
        List.from(data).map<Item>((item) => Item.fromMap(item)).toList();
    // print(data);
    // CatalogModel cat = catalogModelFromJson(res.body) as CatalogModel;

    // list = cat.toJson() as List;

    // print(list);
    setState(() {});
  }

  // @override
  // void dispose() {
  //   // ignore: todo
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      //Header
      appBar: AppBar(
        title: const Center(child: Text("Catalog App")),
        backgroundColor: Colors.yellow.shade700,
      ),

      //Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      gradient: LinearGradient(colors: [
                        Colors.yellow.shade700,
                        Colors.yellow.shade600,
                        Colors.yellow.shade500,
                        Colors.yellow.shade400,
                        Colors.yellow.shade300,
                        Colors.yellow.shade200,
                        Colors.yellow.shade100,
                      ]),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Text("Welcome",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      gradient: LinearGradient(colors: [
                        Colors.yellow.shade700,
                        Colors.yellow.shade600,
                        Colors.yellow.shade500,
                        Colors.yellow.shade400,
                        Colors.yellow.shade300,
                        Colors.yellow.shade200,
                        Colors.yellow.shade100,
                      ]),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Text("Welcome",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      gradient: LinearGradient(colors: [
                        Colors.yellow.shade700,
                        Colors.yellow.shade600,
                        Colors.yellow.shade500,
                        Colors.yellow.shade400,
                        Colors.yellow.shade300,
                        Colors.yellow.shade200,
                        Colors.yellow.shade100,
                      ]),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Text("Welcome",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  gradient: LinearGradient(colors: [
                    Colors.yellow.shade700,
                    Colors.yellow.shade600,
                    Colors.yellow.shade500,
                    Colors.yellow.shade400,
                    Colors.yellow.shade300,
                    Colors.yellow.shade200,
                    Colors.yellow.shade100,
                  ]),
                  borderRadius: BorderRadius.circular(10),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(color: Colors.grey, blurRadius: 50)
                  ],
                ),
                child: const Text("Welcome",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            (CatalogModels.items == null && CatalogModels.items.isEmpty)
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Container(
                    height: height,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(CatalogModels.items[index].title),
                          subtitle:
                              Text("ID : ${CatalogModels.items[index].id}"),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(CatalogModels.items[index].url),
                          ),
                        );
                      },
                      itemCount: CatalogModels.items.length,
                    ),
                  )
          ],
        ),
      ),

      //Footer
      drawer: const MyDrawer(),
    );
  }
}

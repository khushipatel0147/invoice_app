import 'package:flutter/material.dart';
import 'package:invoice_app/Screen/addScreen.dart';
import 'package:invoice_app/Screen/billScreen.dart';
import 'package:invoice_app/Utiles/dataModal.dart';

List<GetData> iteamList = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading:
            Icon(Icons.shopping_bag_outlined, size: 25, color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                setState(() {
                  showDialog(

                      context: context,
                      builder: (context) {
                        return AlertDialog(

                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.close_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black)),
                              ElevatedButton(
                                  onPressed: () {
                                    for (int i = 0; i < iteamList.length; i++) {
                                      sum = sum + iteamList[i].total!;
                                      qtotal = qtotal + iteamList[i].qty!;
                                    }
                                    Navigator.pushNamed(context, 'bill');
                                  },
                                  child: Icon(
                                    Icons.done,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black))
                            ],
                          ),
                          title: Text(
                            "Confirm to Continue",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      barrierDismissible: false);
                });
              },
              child: Icon(Icons.arrow_forward_ios,
                  size: 25, color: Colors.black),
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 23),
            Text(
              "Kisna",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 25),
            ),
            SizedBox(width: 4),
            Text(
              "Beauty Villa",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 18),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Center(
                              child: Text(
                                "No.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 120,
                            child: Center(
                              child: Text(
                                "Product",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 60,
                            child: Center(
                              child: Text(
                                "Qty",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            child: Center(
                              child: Text(
                                "Price",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.black, thickness: 2),
                      SizedBox(height: 5),
                      SizedBox(
                          height: 520,
                          width: double.infinity,
                          child: ListView.builder(
                            itemBuilder: (context, index) => MyList(index),
                            itemCount: iteamList.length,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'add').then(
                      (value) {
                        setState(() {});
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Add Data",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget MyList(int index) {
    return Column(
      children: [
        SizedBox(height: 2.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Center(
                    child: Text(
                  "${index + 1}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ))),
            Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Center(
                    child: Text("${iteamList[index].product}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )))),
            Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Center(
                child: Text(
                  "${iteamList[index].qty}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Center(
                    child: Text("${iteamList[index].price}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )))),
          ],
        ),
        SizedBox(height: 2.5),
      ],
    );
  }
}

import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoice_app/Screen/homeScreen.dart';
import 'package:invoice_app/Utiles/dataModal.dart';
int sum=0;
int qtotal=0;
GlobalKey globalKey = GlobalKey();

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Final Amount",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            sum=0;
            qtotal=0;
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: IconButton(onPressed: () async {
              RenderRepaintBoundary boundary = globalKey.currentContext!
                  .findRenderObject()! as RenderRepaintBoundary;

              var image = await boundary.toImage();
              ByteData? bytdata = await image.toByteData(format: ImageByteFormat.png);
              Uint8List uint8List = bytdata!.buffer.asUint8List();

              await ImageGallerySaver.saveImage(uint8List);
              print(uint8List);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Invoice Saved",style: TextStyle(color: Colors.black),),
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.white,));
            },icon: Icon(Icons.save,
                size: 25, color: Colors.black),)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: RepaintBoundary(
          key: globalKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 680,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    height: 40,
                                    width: 90,
                                    child: Center(
                                        child: Text(
                                      "Product",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          letterSpacing: 1),
                                    ))),
                                Container(
                                    height: 40,
                                    width: 50,
                                    child: Center(
                                        child: Text(
                                      "Qty",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          letterSpacing: 1),
                                    ))),
                                Container(
                                    height: 40,
                                    width: 70,
                                    child: Center(
                                        child: Text(
                                      "Price",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          letterSpacing: 1),
                                    ))),
                                Container(
                                    height: 40,
                                    width: 60,
                                    child: Center(
                                        child: Text(
                                      "Total",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          letterSpacing: 1),
                                    ))),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(height: 2, color: Colors.black, thickness: 2),
                            SizedBox(
                                height: 550,
                                width: double.infinity,
                                child: ListView.builder(
                                    itemBuilder: (context, index) => myvilla(index),
                                    itemCount: iteamList.length)),
                            SizedBox(height: 10),
                            Container(
                              height: 50,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      "Qty : $qtotal",
                                      style: TextStyle(
                                        fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 220,
                                    decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      "Total Price : ${sum}",
                                      style: TextStyle(
                                        fontSize: 20,
                                          letterSpacing: 1,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget myvilla(int index) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: EdgeInsets.all(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 40,
              width: 90,
              child: Center(
                  child: Text(
                    "${iteamList[index].product}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1),
                  ))),
          Container(
              height: 40,
              width: 50,
              child: Center(
                  child: Text(
                    "${iteamList[index].qty}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1),
                  ))),
          Container(
              height: 40,
              width: 70,
              child: Center(
                  child: Text(
                    "${iteamList[index].price}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1),
                  ))),
          Container(
              height: 40,
              width: 60,
              child: Center(
                  child: Text(
                    "${iteamList[index].total}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1),
                  ))),
        ],
      ),
    );
  }
}

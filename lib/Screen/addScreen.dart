import 'dart:core';

import 'package:flutter/material.dart';
import 'package:invoice_app/Screen/billScreen.dart';
import 'package:invoice_app/Screen/homeScreen.dart';
import 'package:invoice_app/Utiles/dataModal.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

List<GetData> proList = [
  GetData(price: 599, qty: 0, product: "Lipstick"),
  GetData(price: 449, qty: 0, product: "Facewash"),
  GetData(price: 399, qty: 0, product: "Serum"),
  GetData(price: 249, qty: 0, product: "Oil"),
  GetData(price: 199, qty: 0, product: "Nailpaint"),
  GetData(price: 699, qty: 0, product: "Kajal"),
  GetData(price: 249, qty: 0, product: "Foundation"),
  GetData(price: 349, qty: 0, product: "Cleaner"),
  GetData(price: 299, qty: 0, product: "EyeShodow"),
  GetData(price: 499, qty: 0, product: "Mascara"),
  GetData(price: 349, qty: 0, product: "Lotion"),
  GetData(price: 699, qty: 0, product: "Lip Pencil"),
  GetData(price: 1049, qty: 0, product: "Lip Gloss"),
  GetData(price: 349, qty: 0, product: "Mirror"),
  GetData(price: 2049, qty: 0, product: "Makeup Kit"),
];

class _AddDataState extends State<AddData> {
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

                  Navigator.pop(context);
                });
              },
              child: Icon(Icons.done, size: 25, color: Colors.black),
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
          padding: const EdgeInsets.all(12),
          child: Container(
            height: 800,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                )),
            child: Column(
              children: [
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
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
                      width: 70,
                      child: Center(
                        child: Text(
                          "Price",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 210,
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
                          "Add",
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
                    height: 610,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, index) => AddList(index),
                      itemCount: proList.length,
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget AddList(int index) {
    return Column(
      children: [
        SizedBox(height: 2.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Center(
                    child: Text("${proList[index].product}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )))),
            Container(
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Center(
                    child: Text("${proList[index].price}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )))),
            Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Center(
                    child: proList[index].qty == 0
                        ? IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  GetData getdata = GetData(
                                      product: proList[index].product,
                                      price: proList[index].price,
                                      qty: proList[index].qty! + 1,
                                      total: proList[index].price!*(proList[index].qty!+1),
                                      );
                                  proList[index] = getdata;
                                  iteamList.add(getdata);
                                },
                              );
                            },
                            icon: Icon(
                              Icons.add_circle,
                              size: 23,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      GetData getdata = GetData(
                                          product: proList[index].product,
                                          price: proList[index].price,
                                          qty: proList[index].qty! - 1,
                                          total: proList[index].price! *
                                              (proList[index].qty! - 1));
                                      proList[index] = getdata;

                                      if (proList[index].qty! > 0) {
                                        for (int i = 0;
                                            i < iteamList.length;
                                            i++) {
                                          if (iteamList[i].product ==
                                              proList[index].product) {
                                            iteamList[i] = getdata;
                                          }
                                        }
                                      } else {
                                        if (getdata.qty! <= 0) {
                                          for (int i = 0;
                                              i < iteamList.length;
                                              i++) {
                                            if (iteamList[i].product ==
                                                proList[index].product) {
                                              iteamList.removeAt(i);
                                            }
                                          }
                                        } else {
                                          iteamList.add(getdata);
                                        }
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.do_not_disturb_on,
                                    size: 23,
                                  )),
                              Text(
                                "${proList[index].qty}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      GetData getdata = GetData(
                                          product: proList[index].product,
                                          price: proList[index].price,
                                          qty: proList[index].qty! + 1,
                                          total: proList[index].price! *
                                              (proList[index].qty! + 1));
                                      proList[index] = getdata;

                                      if (proList[index].qty! > 0) {
                                        for (int i = 0;
                                            i < iteamList.length;
                                            i++) {
                                          if (iteamList[i].product ==
                                              proList[index].product) {
                                            iteamList[i] = getdata;
                                          }
                                        }
                                      } else {
                                        iteamList.add(getdata);
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    size: 23,
                                  )),
                            ],
                          ))),
          ],
        ),
        SizedBox(height: 2.5),
      ],
    );
  }
}

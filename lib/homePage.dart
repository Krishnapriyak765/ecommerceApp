// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          centerTitle: true,
          backgroundColor: primaryColor,
          title: const Text(
            "E-COMMERCE",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Category",
                style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade50),
                          child: Text(
                            "Category Name",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Most searched Products",
                style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(
                  child: StaggeredGridView.countBuilder(
                      physics:  BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 12,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            log("clicked");
                            // Navigator.push(context, MaterialPageRoute(builder: (context){}));
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minHeight: 100, maxHeight: 250),
                                  child: const Image(
                                      image: NetworkImage(
                                          "https://www.shutterstock.com/image-photo/cheerful-happy-woman-enjoying-shopping-260nw-1417347668.jpg")),
                                ),
                              ),
                              Column(
                                children: [ 
                                  Align( 
                                    alignment: Alignment.topLeft,
                                    child: Text("Shoes",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle( 
                                      color: Colors.grey.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Rs. "  + "2000",
                                    style: TextStyle( 
                                      color: Colors.red.shade900,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400
                                    ),),
                                  ),
                                  SizedBox(height: 10,)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                     },
                   );
                  }, staggeredTileBuilder: (context) => StaggeredTile.fit(1) ,
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

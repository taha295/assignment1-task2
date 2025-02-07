import 'package:flutter/material.dart';
import 'package:task1/Details.dart';


class Products extends StatefulWidget{
  const Products({super.key});

  @override

  State<Products> createState() => _ProductsPage();
}

class _ProductsPage extends State<Products>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle menu action
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Handle cart action
                },
              ),
            ]
        ),

        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "What Kind\n",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "of Plants you want", // Second part
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 2)
                        )
                      ]
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.grey[500]),
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        suffixIcon: Icon(Icons.mic, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('All', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                      Text('Small', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.green[200]),),
                      Text('Medium', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                      Text('Hanging', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildBox("Ficas", '\$15', "images/ficas_img.png",context),
                      buildBox("Cactus", '\$15', "images/cactus_img.png",context),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildBox('Samantha', '\$15', "images/samantha_img.png",context),
                      buildBox('Alovera', '\$15', "images/alovera_img.png",context),
                    ],
                  )
                ],
              ),
            )
        ),
    );
  }
}

Widget buildBox(String plantName, String price, String imgUrl, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(name: plantName, price: price, imageUrl: imgUrl),
        ),
      );
    },
    child: Container(
      width: 150,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.green[700],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Indoor',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
                ),
                Icon(Icons.favorite_border, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Image.asset(
              imgUrl,
              width: 150,
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plantName,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "From $price",
                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

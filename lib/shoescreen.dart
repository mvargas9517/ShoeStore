import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shoe.dart';

class ShoeScreen extends StatefulWidget {
  final Shoe shoe;

  ShoeScreen({this.shoe});

  @override
  _ShoeScreenState createState() => _ShoeScreenState();
}

class _ShoeScreenState extends State<ShoeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 35.0,
                      top: 50.0,
                    ),
                    height: 480.0,
                    color: Colors.blueGrey[400],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back,
                                size: 42.0,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart,
                              size: 35.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                        SizedBox(height: 25.0,),
                        Text(
                          widget.shoe.brand,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400,
                         ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          widget.shoe.name,
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '\$${widget.shoe.price}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40.0),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 40.0,
                    bottom: 40.0,
                    child: Hero(
                      tag: widget.shoe.imageUrl,
                      child: Image(
                        height: 200.0,
                        width: 330.0,
                        image: AssetImage(widget.shoe.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 500.0,
                transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                        right: 85.0,
                        top: 35.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Description:',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            widget.shoe.description,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: <Widget>[
                              Text('Colorway:',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 28.0,
                                fontWeight: FontWeight.w700
                              ),),
                          SizedBox(width: 15),
                              Text(widget.shoe.colorway,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 28.0,
                            fontWeight: FontWeight.w400
                          ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 30.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,25.0,0,0),
                            child: Text(
                              'Add to cart:',
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          SizedBox(width: 35.0,),
                          RawMaterialButton(
                            padding: EdgeInsets.all(25.0),
                            shape: CircleBorder(),
                            elevation: 10.0,
                            fillColor: Colors.grey[600],
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            onPressed: () => print('Add to Cart'),
                        ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
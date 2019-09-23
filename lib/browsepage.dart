import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shoescreen.dart';
import 'shoe.dart';


class Browsepage extends StatefulWidget {
  @override
  _BrowsepageState createState() => _BrowsepageState();
}

class _BrowsepageState extends State<Browsepage>  
        with SingleTickerProviderStateMixin {
      TabController _tabController;
      PageController _pageController;
      int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _shoeSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 450.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ShoeScreen(shoe: shoes[index]),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30.0),
              ),
              margin: EdgeInsets.fromLTRB(20.0,5.0,10.0,90.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: shoes[index].imageUrl,
                      child: Image(
                        height: 130.0,
                        width: 220.0,
                        image: AssetImage(
                          'assets/images/shoe$index.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text( '\$${shoes[index].price}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 60.0,
                    bottom: 50.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          shoes[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 60.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 30.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 22.0),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.blueGrey,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 5.0,
              labelColor: Colors.blueGrey[600],
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelPadding: EdgeInsets.symmetric(horizontal: 25.0),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Best Seller',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Running',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Casual',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'New',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Sale',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height: 530.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: shoes.length,
                itemBuilder: (BuildContext context, int index) {
                  return _shoeSelector(index);
                },
              ),
            ),
            ],
            ),
            ),
        );
  }
}

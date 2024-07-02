// ignore: unnecessary_import
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:eliam/categories/accessories_categ.dart";
import "package:eliam/categories/bags_categ.dart";
// import "package:eliam/categories/beauty_categ.dart";
import "package:eliam/categories/electronics_categ.dart";
// import "package:eliam/categories/homegarden_categ.dart";
// import "package:eliam/categories/kids_categ.dart";
import "package:eliam/categories/men_categ.dart";
import "package:eliam/categories/shoes_categ.dart";
import "package:eliam/categories/women_categ.dart";
import "package:eliam/widgets/fake_search.dart";

List<ItemsData> items = [
  ItemsData(label: "Chairs"),
  ItemsData(label: "Desks"),
  ItemsData(label: "Cabinets"),
  ItemsData(label: "Tables"),
  ItemsData(label: "Safes"),
  ItemsData(label: "Tv Stands"),
  // ItemsData(label: "Wardrobe"),
  // ItemsData(label: "Kids"),
  // ItemsData(label: "Beauty"),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    for (var element in items) {
      element.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: sideNavigator(size),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: categView(size),
          ),
        ]),
      ),
      // ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      // color: Colors.grey.shade300,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 30),
                  curve: Curves.bounceIn);
              // for (var element in items){
              //   element.isSelected = false;
              // }
              // setState(() {
              //   items[index].isSelected = true;
              // });
            },
            child: Container(
              color: items[index].isSelected == true
                  ? Colors.white
                  : Colors.grey.shade300,
              height: 100,
              child: Center(
                child: Text(items[index].label),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          for (var element in items) {
            element.isSelected = false;
          }
          setState(() {
            items[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          // HomeGardenCategory(),
          // KidsCategory(),
          // BeautyCategory(),
        ],
      ),
    );
  }
}

class ItemsData {
  String label;
  bool isSelected;
  ItemsData({required this.label, this.isSelected = false});
}

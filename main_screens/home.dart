// import "package:flutter/cupertino.dart";
import "package:eliam/galleries/accessory_gallery.dart";
import "package:eliam/galleries/bags_gallery.dart";
// import "package:eliam/galleries/beauty_gallery.dart";
import "package:eliam/galleries/electronics_gallery.dart";
// import "package:eliam/galleries/homegarden_gallery.dart";
// import "package:eliam/galleries/kids_gallery.dart";
import "package:eliam/galleries/men_gallery.dart";
import "package:eliam/galleries/shoes_gallery.dart";
import "package:eliam/galleries/women_gallery.dart";
import "package:flutter/material.dart";
// import "package:eliam/minor_screens/search.dart";
import "package:eliam/widgets/fake_search.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade100.withOpacity(0.5),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const FakeSearch(),
            bottom: const TabBar(
              isScrollable: true,
              indicatorColor: Colors.yellow,
              indicatorWeight: 8,
              tabs: [
                RepeatedTab(
                  label: "Chairs",
                ),
                RepeatedTab(label: "Desks"),
                RepeatedTab(label: "Coffee Table"),
                RepeatedTab(
                  label: "Safe",
                ),
                RepeatedTab(label: "Tv Stands"),
                // RepeatedTab(label: "Wardrobe"),
                RepeatedTab(
                  label: "Cabinets",
                ),
                // RepeatedTab(label: "Kids"),
                // RepeatedTab(label: "Beauty"),
              ],
            ),
          ),
          body: const SafeArea(
            child: TabBarView(
              children: [
               MenGalleryScreen(),
                WomenGalleryScreen(),
                ShoesGalleryScreen(),
                BagsGalleryScreen(),
              ElectronicsGalleryScreen(),
               AccessoriesGalleryScreen(),
              //  HomeGardenGalleryScreen(),
              //  KidsGalleryScreen(),
                // BeautyGalleryScreen(),
              ],
            ),
          )),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}

import "package:eliam/utilities/categ_list.dart";
import "package:flutter/material.dart";
// import "package:eliam/minor_screens/subcateg_products.dart";
// import "package:eliam/utilities/categ_list.dart";
import "package:eliam/widgets/categ_widgets.dart";

class AccessoriesCategory extends StatelessWidget {
  const AccessoriesCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text("Tv Stands",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5)),
                      ),
                      Column(
                        children: [
                          const CategHeaderLabel(headerLabel: "Tv Stands"),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.68,
                              child: GridView.count(
                                mainAxisSpacing: 70,
                                crossAxisSpacing: 15,
                                crossAxisCount: 3,
                                children:
                                    List.generate(stand.length -1, (index) {
                                  return SubcategModel(
                                    maincategName: "accessories",
                                    subCategName: stand[index +1],
                                    assetName:
                                        "image/stand/stand$index.jpg",
                                    subcategLabel: stand[index +1],
                                  );
                                }),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar(
              maincategName: "Tv Stands",
            ),
          )
        ],
      ),
    );
  }
}

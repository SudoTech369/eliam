import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliam/models/product_models.dart';
// import 'package:eliam/utilities/categ_list.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class WomenGalleryScreen extends StatefulWidget {
  const WomenGalleryScreen({Key? key}) : super(key: key);

  @override
  State<WomenGalleryScreen> createState() => _WomenGalleryScreenState();
}

class _WomenGalleryScreenState extends State<WomenGalleryScreen> {
  final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
      .collection('products')
      .where('maincateg', isEqualTo: 'women')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.docs.isEmpty) {
          return const Center(
              child: Text(
            'This category \n\n has no items yet!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ));
        }

        return SingleChildScrollView(
          child: StaggeredGridView.countBuilder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return ProductModel(products:snapshot.data!.docs[index]);
              },
              staggeredTileBuilder: (context) => const StaggeredTile.fit(1)),
        );

        //  ListView(
        //   children: snapshot.data!.docs.map((DocumentSnapshot document){
        //     Map<String,dynamic>data = document.data()! as Map<String,dynamic>;
        //     return ListTile(
        //       leading: Image(image: NetworkImage(data['proimages'][0]),),
        //       title:Text(data['proname']),
        //       subtitle:Text(data['price'].toString()),
        //     );
        //   }).toList(),
        // );
      },
    );
  }
}


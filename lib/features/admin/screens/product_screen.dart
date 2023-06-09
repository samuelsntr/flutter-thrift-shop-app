import 'package:amazone_clone/common/widget/loader.dart';
import 'package:amazone_clone/constants/global_variables.dart';
import 'package:amazone_clone/features/account/widgets/single_product.dart';
import 'package:amazone_clone/features/admin/screens/add_product.dart';
import 'package:amazone_clone/features/admin/services/admin_services.dart';
import 'package:amazone_clone/models/product.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product>? products;
  AdminServices adminServices = AdminServices();

  @override
  void initState() {
    fetchAllProducts();
    super.initState();
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        setState(() {
          products!.removeAt(index);
        });
      },
    );
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProduct(context);
    setState(() {});
  }

  void navigateAddProduct() {
    Navigator.pushNamed(context, AddProduct.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return products == null
            ? const Loader()
            : Scaffold(
                body: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: SingleProduct(
                            image: productData.images[0],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            productData.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        IconButton(
                          onPressed: () => deleteProduct(productData, index),
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ],
                    ),
                  );
                },
              ));
        // floatingActionButton: FloatingActionButton(
        //   onPressed: navigateAddProduct,
        //   backgroundColor: Colors.transparent,
        //   tooltip: 'Add a Product',
        //   child: const Icon(
        //     Icons.add,
        //     color: Colors.black,
        //   ),
        // ),
        //   floatingActionButtonLocation:
        //       FloatingActionButtonLocation.centerFloat,
        // );
      } else {
        // Portrait mode layout remains unchanged
        return products == null
            ? const Loader()
            : Scaffold(
                body: GridView.builder(
                    itemCount: products!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final productData = products![index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 139,
                            child: SingleProduct(
                              image: productData.images[0],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  productData.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                    deleteProduct(productData, index),
                                icon: const Icon(Icons.delete_outline),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                floatingActionButton: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: GlobalVariables.appBarGradient,
                  ),
                  child: FloatingActionButton(
                    elevation: 0,
                    onPressed: navigateAddProduct,
                    backgroundColor: Colors
                        .transparent, // Atur latar belakang FAB menjadi transparan
                    tooltip: 'Add a Product',
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
              );
      }
    });
  }
}


// class ProductScreen extends StatefulWidget {
//   const ProductScreen({super.key});

//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   List<Product>? products;
//   AdminServices adminServices = AdminServices();

//   @override
//   void initState() {
//     fetchAllProducts();
//     super.initState();
//   }

//   void deleteProduct(Product product, int index) {
//     adminServices.deleteProduct(
//         context: context,
//         product: product,
//         onSuccess: () {
//           setState(() {
//             products!.removeAt(index);
//           });
//         });
//   }

//   fetchAllProducts() async {
//     products = await adminServices.fetchAllProduct(context);
//     setState(() {});
//   }

//   void navigateAddProduct() {
//     Navigator.pushNamed(context, AddProduct.routeName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return products == null
//         ? const Loader()
//         : Scaffold(
//             body: GridView.builder(
//                 itemCount: products!.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                 ),
//                 itemBuilder: (context, index) {
//                   final productData = products![index];
//                   return Column(
//                     children: [
//                       SizedBox(
//                         height: 139,
//                         child: SingleProduct(
//                           image: productData.images[0],
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               productData.name,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 2,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () => deleteProduct(productData, index),
//                             icon: const Icon(Icons.delete_outline),
//                           ),
//                         ],
//                       ),
//                     ],
//                   );
//                 }),
//             floatingActionButton: Container(
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: GlobalVariables.appBarGradient,
//               ),
//               child: FloatingActionButton(
//                 elevation: 0,
//                 onPressed: navigateAddProduct,
//                 backgroundColor: Colors
//                     .transparent, // Atur latar belakang FAB menjadi transparan
//                 tooltip: 'Add a Product',
//                 child: const Icon(
//                   Icons.add,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerFloat,
//           );
//   }
// }

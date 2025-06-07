import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tyreplex_demo/core/constants/color_constants.dart'
    show ColorConstants;
import 'package:tyreplex_demo/core/constants/string_constants.dart';
import '../../core/models/product_model.dart';

class DetailView extends StatelessWidget {
  final Product product;
  const DetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(product.title ?? "", maxLines: 1),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > 600;
          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Visibility(visible: false, child: Icon(Icons.arrow_back)),
                  Icon(Icons.shopping_cart_checkout_outlined),
                ],
              ),
              const SizedBox(height: 12),

              // Image carousel
              CarouselSlider(
                items: product.images!.map((img) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      img,
                      fit: BoxFit.fill,
                      width: 300,
                      height: 250,
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 250,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                ),
              ),

              const SizedBox(height: 8),
              const SizedBox(height: 12),
              Text(
                product.title ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${product.brand} ${StringConstants.collection}'),
              const SizedBox(height: 6),

              // Rating stars
              Row(
                children: [
                  ...List.generate(5, (index) {
                    return Icon(
                      index < product.rating!.round()
                          ? Icons.star
                          : Icons.star_border,
                      color: Colors.orange,
                      size: 18,
                    );
                  }),
                  const SizedBox(width: 6),
                  Text(product.rating!.toStringAsFixed(1)),
                ],
              ),

              const SizedBox(height: 6),

              // Price
              Row(
                children: [
                  Text(
                    '₹${getOriginalPrice().toStringAsFixed(0)}',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '₹${product.price!.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${product.discountPercentage!.toStringAsFixed(0)} ${StringConstants.percentOff}',
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              const Text(
                StringConstants.productDetails,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                product.description ?? "",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 12),

              // Tags
              Row(
                children: [
                  _tag(StringConstants.nearestStore),
                  _tag(StringConstants.vip),
                  _tag(StringConstants.returnPolicy),
                ],
              ),

              const SizedBox(height: 12),

              // Action buttons
              isWideScreen
                  ? Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            label: const Text(
                              StringConstants.goToCart,
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  12,
                                ), 
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(flex: 1, child: Container()),

                        Expanded(
                          flex: 1,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.flash_on,
                              color: Colors.white,
                            ),
                            label: const Text(
                              StringConstants.buyNow,
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                      ],
                    )
                  : Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart, color: Colors.white),
                      label: const Text(
                        StringConstants.goToCart,
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.flash_on, color: Colors.white),
                      label: const Text(
                        StringConstants.buyNow,
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              // Row(
              //   children: [
              //     Expanded(
              //       child: ElevatedButton.icon(
              //         onPressed: () {},
              //         icon: const Icon(Icons.shopping_cart, color: Colors.white),
              //         label: const Text(
              //           StringConstants.goToCart,
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.black,
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 12),
              //     Expanded(
              //       child: ElevatedButton.icon(
              //         onPressed: () {},
              //         icon: const Icon(Icons.flash_on, color: Colors.white),
              //         label: const Text(
              //           StringConstants.buyNow,
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.black,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 12),

              // Delivery banner
              isWideScreen
                  ? Container(
                      width: 200,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ColorConstants.mainColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: StringConstants.deliveryIn,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: StringConstants.oneWithinHour,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ColorConstants.mainColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: StringConstants.deliveryIn,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: StringConstants.oneWithinHour,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              const SizedBox(height: 12),
            ],
          );
        },
      ),
    );
  }

  Widget _tag(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(title),
    );
  }

  double getOriginalPrice() {
    return product.price! / (1 - product.discountPercentage! / 100);
  }
}

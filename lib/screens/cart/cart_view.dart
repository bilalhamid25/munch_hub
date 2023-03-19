import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_hub/screens/cart/cart_viewmodel.dart';
import 'package:munch_hub/widgets/custom_buttons.dart';

class CartView extends StatelessWidget {
  final CartViewModel cartViewModel = Get.put(CartViewModel());

  CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Obx(
          () => (cartViewModel.cartList.isNotEmpty)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      productListView(),
                      calculationContainer(),
                      checkOutButton(),
                    ],
                  ),
                )
              : emptyCartView(),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('Cart'),
      centerTitle: true,
    );
  }

  Widget productListView() {
    return Obx(
      () => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cartViewModel.cartList.length,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return productListViewItem(index);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
            thickness: 0.7,
          );
        },
      ),
    );
  }

  Widget productListViewItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      child: Row(
        children: [
          image(index),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartViewModel.cartList[index].name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xff031F4B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      cartViewModel.cartList[index].description ?? "",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Obx(
                      () => Row(
                        children: [
                          Text(
                            '${cartViewModel.cartList[index].count ?? 0} x \$${cartViewModel.cartList[index].price ?? 0} = ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${(cartViewModel.cartList[index].count ?? 0) * (cartViewModel.cartList[index].price ?? 0)}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xffE23744),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffE13F45), width: 1.4),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    cartViewModel.onItemIncrementToCart(index);
                  },
                  child: const Icon(
                    Icons.add_circle_outline,
                    size: 20,
                    color: Color(0xffE13F45),
                  ),
                ),
                Obx(
                  () => Text(
                    "${cartViewModel.cartList[index].count}",
                  ),
                ),
                Obx(
                  () => ((cartViewModel.cartList[index].count ?? 0) > 1)
                      ? InkWell(
                          onTap: () {
                            cartViewModel.onItemDecrementToCart(index);
                          },
                          child: const Icon(
                            Icons.remove_circle_outline,
                            size: 20,
                            color: Color(0xffE13F45),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            cartViewModel.onRemoveCartItem(index);
                          },
                          child: const Icon(
                            Icons.delete_outline_rounded,
                            size: 23,
                            color: Color(0xffE13F45),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget image(int index) {
    return SizedBox(
      width: 80,
      height: 80,
      child: CachedNetworkImage(
        imageUrl:
            "https://ordermaya.drogenidesoftware.com/public/img/profile_imgs/93efd004-5aaa-4317-9651-d5f2af8ea715_CowrUddqPY.jpeg",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
            ),
          ),
        ),
        placeholder: (context, url) => Container(
          padding: const EdgeInsets.all(30),
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            color: Color(0xff801717),
          ),
        ),
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/no_image.jpg'),
      ),
    );
  }

  Widget emptyCartView() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Image(
              image: AssetImage('assets/images/yourCartIsEmpty.png'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: CustomButton1(
              backgroundColor: const Color(0xffE13F45),
              text: const Text(
                'Go Shopping',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget calculationContainer() {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: 12,
            spreadRadius: 3,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Items Total',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xff031F4B),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Charges',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Obx(
                  () => Text(
                    '\$${cartViewModel.grandTotal.value}',
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Color(0xff031F4B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Discount',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Obx(
                  () => Text(
                    '- \$${cartViewModel.grandTotal.value}',
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Color(0xffE23744),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tax & Charges',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Obx(
                  () => Text(
                    '\$${cartViewModel.grandTotal.value}',
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Grand Total',
                style: TextStyle(
                  fontSize: 16.5,
                  color: Color(0xff031F4B),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Obx(
                () => Text(
                  '\$${cartViewModel.grandTotal.value}',
                  style: const TextStyle(
                    fontSize: 16.5,
                    color: Color(0xffE13F45),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget checkOutButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: CustomButton1(
        backgroundColor: const Color(0xffE13F45),
        text: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_cataloge/core/store.dart';
import 'package:mobile_cataloge/models/cart.dart';
import 'package:pay/pay.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CardTotal(),
        ],
      ),
    );
  }
}

class _CardTotal extends StatelessWidget {
  final _paymentItems = <PaymentItem>[];

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, _) {
              _paymentItems.add(
                PaymentItem(
                  amount: _cart.totalPrice.toString(),
                  label: "Mobile Catalog",
                  status: PaymentItemStatus.final_price,
                ),
              );
              return "\u{20B9}${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.accentColor)
                  .make();
            },
          ),
          30.widthBox,
          VxBuilder(
            mutations: {AddMutation, RemoveMutation},
            builder: (context, _) {
              return (_cart.items.length > 0)
                  ? Row(
                      children: [
                        ApplePayButton(
                          width: 200,
                          height: 50,
                          paymentConfigurationAsset: 'applepay.json',
                          paymentItems: _paymentItems,
                          style: ApplePayButtonStyle.black,
                          type: ApplePayButtonType.buy,
                          margin: const EdgeInsets.only(top: 15.0),
                          onPaymentResult: (data) {
                            print(data);
                          },
                          loadingIndicator: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        GooglePayButton(
                          width: 200,
                          height: 50,
                          paymentConfigurationAsset: 'gpay.json',
                          paymentItems: _paymentItems,
                          style: GooglePayButtonStyle.black,
                          type: GooglePayButtonType.pay,
                          margin: const EdgeInsets.only(top: 15.0),
                          onPaymentResult: (data) {
                            print(data);
                          },
                          loadingIndicator: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: Vx.red500, width: 3),
                      ),
                      child: "No Items"
                          .text
                          .xl2
                          .bold
                          .color(context.theme.accentColor)
                          .make()
                          .px8(),
                    );
            },
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Cart is empty".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(_cart.items[index]),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}

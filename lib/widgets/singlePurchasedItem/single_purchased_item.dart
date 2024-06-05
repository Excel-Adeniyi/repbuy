


import 'package:flutter/material.dart';

class SinglePurchasedItemPage extends StatelessWidget {
  const SinglePurchasedItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Container(
            color: Colors.grey,
            child: Column(
              children: [
                const Row(children: [
                  Text('Purchase Type:'),
                  Text("Something")
                ],),
                const Row(children: [
                  Text('Product:'),
                  Text("Something")
                ],),
                const Row(children: [
                  Text('Product:'),
                  Text("Something")
                ],),
                const Row(children: [
                  Text('Amount:'),
                  Text("Something")
                ],),
                const Row(children: [
                  Text('Number:'),
                  Text("Something")
                ],),
                const Row(children: [
                  Text('Status:'),
                  Text("Something")
                ],),
                const Row(children: [
                  Text('transaction id:'),
                  Text("Something")
                ],),
                TextButton(onPressed: (){}, child: const Text("Done"))
              ],
            ),
            
          ),
        )),
    );
  }
}
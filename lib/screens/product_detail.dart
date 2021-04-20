import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

// ignore: must_be_immutable
class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail(this.product);

  @override
  _ProductDetailState createState() => _ProductDetailState(product);
}

enum Options { delete, update }

class _ProductDetailState extends State<ProductDetail> {
  Product product;
  _ProductDetailState(this.product);
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();

  @override
  void initState() {
    txtName.text = product.name;
    txtDescription.text = product.description;
    txtUnitPrice.text = product.unitPrice.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ürün detayı : ${product.name}"),
          actions: [
            PopupMenuButton<Options>(
                onSelected: selectProcess,
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Options>>[
                      PopupMenuItem<Options>(
                          value: Options.delete, child: Text("Sil")),
                      PopupMenuItem<Options>(
                          value: Options.update, child: Text("Güncelle"))
                    ])
          ],
        ),
        //Text(product.name+" "+product.description+""+product.unitPrice.toString()+" "+product.id.toString())

        body: buildProductDetail());
  }

  buildProductDetail() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [buildNameField(), buildDescriptionField(), buildUnitPrice()],
      ),
    );
  }

  void selectProcess(Options options) async {
    switch (options) {
      case Options.delete:
        await dbHelper.delete(product.id);
        Navigator.pop(context, true);
        break;

      case Options.update:
        await dbHelper.update(Product.withId(
            id: product.id,
            name: txtName.text,
            description: txtDescription.text,
            unitPrice: double.tryParse(txtUnitPrice.text)));
        Navigator.pop(context, true);
        break;
      default:
    }
  }

  buildNameField() => TextField(
      decoration: InputDecoration(labelText: "Ürün adı"), controller: txtName);
  buildDescriptionField() => TextField(
      decoration: InputDecoration(labelText: "Ürün Açıklaması"),
      controller: txtDescription);
  buildUnitPrice() => TextField(
      decoration: InputDecoration(labelText: "Ürün Fiyatı"),
      controller: txtUnitPrice);

  //buildUpdateButton()=>TextButton(onPressed: (){updateProduct();}, child: Text("Ekle"));

  // void updateProduct()async {
  // var result=  await dbHelper.update(Product(name:txtName.text,description:txtDescription.text,unitPrice:double.tryParse(txtUnitPrice.text)));
  // Navigator.pop(context,true);
  // }
}

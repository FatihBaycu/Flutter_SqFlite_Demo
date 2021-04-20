import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget {
  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  var dbHelper=DbHelper();
  var txtName=TextEditingController();
  TextEditingController txtDescription=TextEditingController();
  TextEditingController txtUnitPrice=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text("Ürün ekleme sayfası"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            buildNameField(),
            buildDescriptionField(),
            buildUnitPrice(),
            buildSaveButton()
                      ],
                    ),
                  ),
                );
              }
            
               buildNameField() {
                 return TextField(
                   decoration: InputDecoration(labelText: "Ürün Adı"),
                   controller: txtName,
                 );
               }
            
              buildDescriptionField() =>TextField(decoration: InputDecoration(labelText: "Ürün Açıklaması"),controller: txtDescription);
              buildUnitPrice()        =>TextField(decoration: InputDecoration(labelText: "Ürün Fiyatı"),    controller: txtUnitPrice);
            
              buildSaveButton()=>TextButton(onPressed: (){addProduct();}, child: Text("Ekle"));
              
                void addProduct()async {
                var result=  await dbHelper.insert(Product(name:txtName.text,description:txtDescription.text,unitPrice:double.tryParse(txtUnitPrice.text)));
                Navigator.pop(context,true);

                //  if(result!=null){
                //      if(result==true){
                //        Navigator.pop(context,true);
                //      }
                //  }
                }
                }

              



// import 'package:flutter/material.dart';
// import 'package:sqflite_demo/models/product.dart';
// import 'package:sqflite_demo/data/dbHelper.dart';

// class ProductAdd extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//  return _ProductAddState();
//   }
// }

// class _ProductAddState extends State<ProductAdd>{
//   var dbHelper=DbHelper();
//   var txtName=TextEditingController();
//   var txtDescription=TextEditingController();
//   var txtUnitPrice=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(title:Text("Ürün Ekle")),
//         body:Padding(
//           padding: EdgeInsets.all(30.0),
//         child: Column(
//           children: <Widget>[
//             buildNameField(),
//             buildNameDescription(),
//             buildNameUnitPrice(),
//             buildSaveButton()
//           ],
//          ),
//         ),
//       );
//     }

//   buildNameField() {
//     return TextField(
//       decoration: InputDecoration(labelText: "Ürün Adı"),
//       controller: txtName,);

//   }
//   buildNameDescription() {
//     return TextField(
//       decoration: InputDecoration(labelText: "Ürün Açıklaması"),
//     controller: txtDescription,);
//   }

//   buildNameUnitPrice() {
//     return TextField(
//       decoration: InputDecoration(labelText: "Birim Fiyatı"),
//     controller: txtUnitPrice,);

//   }

//   buildSaveButton(){
//     return TextButton(
//         child:Text("Ekle"),
//     onPressed:(){
//           addProduct();
//     });
//   }

//   void addProduct() async{
//     var result= await dbHelper.insert(Product(name:txtName.text, description:txtDescription.text, unitPrice:double.tryParse(txtUnitPrice.text)));
//     Navigator.pop(context,true);
//   }

// }

import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';
import 'package:sqflite_demo/screens/product_add.dart';
import 'package:sqflite_demo/screens/product_detail.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  //DbHelper dbHelper=new DbHelper();
  var dbHelper = DbHelper();
  int productCount = 0;
  List<Product> products;

  @override
  void initState()  {
     getProducts();
    print("Çalışıyor...");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün listesi"),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToProductAdd();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni Ürün Ekle",
      ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
        itemCount: productCount,        
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.yellowAccent,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Text("P"),
              ),
              title: Text(this.products[position].name),
              subtitle: Text(this.products[position].description),
              onTap: () {goToProductDetail(this.products[position]);},
                          ),
                        );
                      });
                }
              
                void goToProductAdd() async {
                  bool result = await Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ProductAdd()));
                  //Navigator.push(context,MaterialPageRoute(builder: (context) =>ProductAdd()),).then((value)  =>setState((){}));
                  if (result != null) {
                    if (result) {
                      setState(() {
                        getProducts();
                      });
                    }
                  }
                }
              
                void getProducts() async {
                  var productsFuture = dbHelper.getProducts();
                  productsFuture.then((value) {
                    setState(() {
                       this.products = value;
                    this.productCount = value.length;
                    });
                   
                  });
                }
              
                void goToProductDetail(Product product) async {
                  bool result=await Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductDetail(product)));
                 if(result!=null){
                  if(result){
                    getProducts();
                  }
                  }
                }
}

// import 'package:flutter/material.dart';
// import 'package:sqflite_demo/data/dbHelper.dart';
// import 'package:sqflite_demo/models/product.dart';
// import 'package:sqflite_demo/screens/product_add.dart';

// class ProductList extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ProductListState();
//   }
// }

// class _ProductListState extends State<ProductList> {
//   var dbHelper = DbHelper();
//   List<Product> products;
//   int productCount = 0;

//   @override
//   void initState() {
//     getProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: (AppBar(title: Text("Ürün Listesi"))),
//       body: buildProductList()
//     );
//   }

//   ListView buildProductList() {
//     print("listelendi.");
//     print(products);
//     return ListView.builder(
//         itemCount: productCount,
//         itemBuilder: (BuildContext context, int position) {
//           return Card(

//             color: Colors.cyan,
//             elevation: 2,
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: Colors.black12,
//                 child: Text("P"),
//               ),
//               title: Text(this.products[position].name),
//               subtitle: Text(this.products[position].description),
//               onTap: () {},
//             ),
//           );
//         });
//   }

//   void goToProductAdd() async {
//     //await Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductAdd()),).then((value) => setState(() {}));

//     await Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductAdd()),).then((value) => setState(() {}));

//     bool result=await Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductAdd()));

//      if(result!=null){
//       if(result==true){
//         getProducts();
//       }
//     }
//   }
//   void getProducts() async{
//     var productsFuture = dbHelper.getProducts();
//     productsFuture.then((data) {
//       this.products=data;
//       productCount = data.length;
//     });
//   }
// }

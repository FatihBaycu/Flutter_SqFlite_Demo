class Product{
  int id;
  String name;
  String description;
  double unitPrice;

  Product({this.name,this.description,this.unitPrice});
  Product.withId({this.id,this.name,this.description,this.unitPrice});

  Product.fromObject(dynamic o){

    this.id=o["id"];
    this.name=o["name"];
    this.description=o["description"];
    this.unitPrice=double.tryParse(o["unitPrice"].toString());
  }

  Map<String,dynamic> toMap(){
   var map= Map<String,dynamic>();
   map["name"]=name;
   map["description"]=description;
   map["unitPrice"]=unitPrice;
    if(id!=null){
      map["id"]=id;
    }
    return map;
  }
}
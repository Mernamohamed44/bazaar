class DataModel{
  String?priceBefore;
  String?image;
  String?name;
  String?priceAfter;

  DataModel(
      {
        this.name,
        this.priceBefore,
        this.image,
        this.priceAfter
      }
      );
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    name: json["name"] == null ? null : json["name"],
    priceBefore: json["priceBefore"] == null ? null : json["priceBefore"],
    priceAfter: json["priceAfter"] == null ? null : json["priceAfter"],
    image: json["image"] == null ? null : json["image"],
  );
  Map<String,dynamic>toMap(){
    return {
      'name':name,
      'price':priceAfter,
      'image':image
    };
  }
}
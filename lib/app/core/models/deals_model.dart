class DealsModel{
  DealsModel(
      {this.id,
      this.dealName,
      this.pieces,
      this.date,
      this.price,
      this.oldPrice,
      this.color});

  int? id;
  String? dealName;
  int? pieces;
  String? date;
  String? price;
  String? oldPrice;
  String? color;
}

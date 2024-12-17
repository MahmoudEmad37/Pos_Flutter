class SellLinesModel {
  int? id;
  int? transactionId;
  int? productId;
  int? variationId;
  int? quantity;
  String? secondaryUnitQuantity;
  String? quantityReturned;
  String? unitPriceBeforeDiscount;
  String? unitPrice;
  String? lineDiscountType;
  String? lineDiscountAmount;
  String? unitPriceIncTax;
  String? itemTax;
  String? sellLineNote;
  String? soQuantityInvoiced;
  String? childrenType;
  String? createdAt;
  String? updatedAt;

  SellLinesModel(
      {this.id,
      this.transactionId,
      this.productId,
      this.variationId,
      this.quantity,
      this.secondaryUnitQuantity,
      this.quantityReturned,
      this.unitPriceBeforeDiscount,
      this.unitPrice,
      this.lineDiscountType,
      this.lineDiscountAmount,
      this.unitPriceIncTax,
      this.itemTax,
      this.sellLineNote,
      this.soQuantityInvoiced,
      this.childrenType,
      this.createdAt,
      this.updatedAt});

  SellLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction_id'];
    productId = json['product_id'];
    variationId = json['variation_id'];
    quantity = json['quantity'];
    secondaryUnitQuantity = json['secondary_unit_quantity'];
    quantityReturned = json['quantity_returned'];
    unitPriceBeforeDiscount = json['unit_price_before_discount'];
    unitPrice = json['unit_price'];
    lineDiscountType = json['line_discount_type'];
    lineDiscountAmount = json['line_discount_amount'];
    unitPriceIncTax = json['unit_price_inc_tax'];
    itemTax = json['item_tax'];
    sellLineNote = json['sell_line_note'];
    soQuantityInvoiced = json['so_quantity_invoiced'];
    childrenType = json['children_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction_id'] = this.transactionId;
    data['product_id'] = this.productId;
    data['variation_id'] = this.variationId;
    data['quantity'] = this.quantity;
    data['secondary_unit_quantity'] = this.secondaryUnitQuantity;
    data['quantity_returned'] = this.quantityReturned;
    data['unit_price_before_discount'] = this.unitPriceBeforeDiscount;
    data['unit_price'] = this.unitPrice;
    data['line_discount_type'] = this.lineDiscountType;
    data['line_discount_amount'] = this.lineDiscountAmount;
    data['unit_price_inc_tax'] = this.unitPriceIncTax;
    data['item_tax'] = this.itemTax;
    data['sell_line_note'] = this.sellLineNote;
    data['so_quantity_invoiced'] = this.soQuantityInvoiced;
    data['children_type'] = this.childrenType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
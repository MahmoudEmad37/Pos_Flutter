import 'package:pos_flutter/modules/home/data/models/product_model/pivot_model.dart';

class ProductLocationsModel {
  int? id;
  int? businessId;
  String? locationId;
  String? name;
  String? landmark;
  String? country;
  String? state;
  String? city;
  String? zipCode;
  int? invoiceSchemeId;
  int? invoiceLayoutId;
  int? saleInvoiceLayoutId;
  int? sellingPriceGroupId;
  int? printReceiptOnInvoice;
  String? receiptPrinterType;
  String? mobile;
  int? isActive;
  String? defaultPaymentAccounts;
  PivotModel? pivot;

  ProductLocationsModel(
      {this.id,
      this.businessId,
      this.locationId,
      this.name,
      this.landmark,
      this.country,
      this.state,
      this.city,
      this.zipCode,
      this.invoiceSchemeId,
      this.invoiceLayoutId,
      this.saleInvoiceLayoutId,
      this.sellingPriceGroupId,
      this.printReceiptOnInvoice,
      this.receiptPrinterType,
     
      this.mobile,

      this.isActive,
      this.defaultPaymentAccounts,

      this.pivot});

  ProductLocationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    locationId = json['location_id'];
    name = json['name'];
    landmark = json['landmark'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
    invoiceSchemeId = json['invoice_scheme_id'];
    invoiceLayoutId = json['invoice_layout_id'];
    saleInvoiceLayoutId = json['sale_invoice_layout_id'];
    sellingPriceGroupId = json['selling_price_group_id'];
    printReceiptOnInvoice = json['print_receipt_on_invoice'];
    receiptPrinterType = json['receipt_printer_type'];
    mobile = json['mobile'];

    isActive = json['is_active'];
    defaultPaymentAccounts = json['default_payment_accounts'];

    pivot = json['pivot'] != null ? new PivotModel.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['location_id'] = this.locationId;
    data['name'] = this.name;
    data['landmark'] = this.landmark;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zip_code'] = this.zipCode;
    data['invoice_scheme_id'] = this.invoiceSchemeId;
    data['invoice_layout_id'] = this.invoiceLayoutId;
    data['sale_invoice_layout_id'] = this.saleInvoiceLayoutId;
    data['selling_price_group_id'] = this.sellingPriceGroupId;
    data['print_receipt_on_invoice'] = this.printReceiptOnInvoice;
    data['receipt_printer_type'] = this.receiptPrinterType;
    data['mobile'] = this.mobile;
    data['is_active'] = this.isActive;
    data['default_payment_accounts'] = this.defaultPaymentAccounts;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}
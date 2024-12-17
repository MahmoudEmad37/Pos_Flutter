import 'package:pos_flutter/modules/home/data/models/contact_model/contact_model.dart';
import 'package:pos_flutter/modules/home/data/models/payment_lines_model.dart/payment_liens_model.dart';
import 'package:pos_flutter/modules/home/data/models/sell_model/sell_lines_model.dart';

class SellModel {
  int? id;
  int? businessId;
  int? locationId;
  String? type;
  String? status;
  int? isQuotation;
  String? paymentStatus;
  int? contactId;
  String? invoiceNo;
  String? refNo;
  String? transactionDate;
  String? totalBeforeTax;
  String? taxAmount;
  String? discountType;
  String? discountAmount;
  int? rpRedeemed;
  String? rpRedeemedAmount;
  String? shippingDetails;
  String? shippingAddress;
  String? deliveryDate;
  String? shippingStatus;
  String? deliveredTo;
  String? shippingCharges;
  int? isExport;
  String? roundOffAmount;
  String? finalTotal;
  String? exchangeRate;
  int? createdBy;
  String? packingCharge;
  int? isCreatedFromApi;
  int? rpEarned;
  String? orderAddresses;
  int? isRecurring;
  int? recurInterval;
  String? recurIntervalType;
  int? recurRepetitions;
  String? invoiceToken;
  List<SellLinesModel>? sellLines;
  List<PaymentLinesModel>? paymentLines;
  ContactModel? contact;
  String? invoiceUrl;
  String? paymentLink;

  SellModel(
      {this.id,
      this.businessId,
      this.locationId,
      this.type,
      this.status,
      this.isQuotation,
      this.paymentStatus,
      this.contactId,
      this.invoiceNo,
      this.refNo,
      this.transactionDate,
      this.totalBeforeTax,
      this.taxAmount,
      this.discountType,
      this.discountAmount,
      this.rpRedeemed,
      this.rpRedeemedAmount,
      this.shippingDetails,
      this.shippingAddress,
      this.deliveryDate,
      this.shippingStatus,
      this.deliveredTo,
      this.shippingCharges,
      this.isExport,
      this.roundOffAmount,
      this.finalTotal,
      this.exchangeRate,
      this.createdBy,
      this.packingCharge,
      this.isCreatedFromApi,
      this.rpEarned,
      this.orderAddresses,
      this.isRecurring,
      this.recurInterval,
      this.recurIntervalType,
      this.recurRepetitions,
      this.invoiceToken,
      this.sellLines,
      this.paymentLines,
      this.contact,
      this.invoiceUrl,
      this.paymentLink});

  SellModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    locationId = json['location_id'];
    type = json['type'];
    status = json['status'];
    isQuotation = json['is_quotation'];
    paymentStatus = json['payment_status'];
    contactId = json['contact_id'];
    invoiceNo = json['invoice_no'];
    refNo = json['ref_no'];
    transactionDate = json['transaction_date'];
    totalBeforeTax = json['total_before_tax'];
    taxAmount = json['tax_amount'];
    discountType = json['discount_type'];
    discountAmount = json['discount_amount'];
    rpRedeemed = json['rp_redeemed'];
    rpRedeemedAmount = json['rp_redeemed_amount'];
    shippingDetails = json['shipping_details'];
    shippingAddress = json['shipping_address'];
    deliveryDate = json['delivery_date'];
    shippingStatus = json['shipping_status'];
    deliveredTo = json['delivered_to'];
    shippingCharges = json['shipping_charges'];
    isExport = json['is_export'];
    roundOffAmount = json['round_off_amount'];
    finalTotal = json['final_total'];
    exchangeRate = json['exchange_rate'];
    createdBy = json['created_by'];
    packingCharge = json['packing_charge'];
    isCreatedFromApi = json['is_created_from_api'];
    rpEarned = json['rp_earned'];
    orderAddresses = json['order_addresses'];
    isRecurring = json['is_recurring'];
    recurInterval = json['recur_interval'];
    recurIntervalType = json['recur_interval_type'];
    recurRepetitions = json['recur_repetitions'];
    invoiceToken = json['invoice_token'];
    if (json['sell_lines'] != null) {
      sellLines = <SellLinesModel>[];
      json['sell_lines'].forEach((v) {
        sellLines!.add(new SellLinesModel.fromJson(v));
      });
    }
    if (json['payment_lines'] != null) {
      paymentLines = <PaymentLinesModel>[];
      json['payment_lines'].forEach((v) {
        paymentLines!.add(new PaymentLinesModel.fromJson(v));
      });
    }
    contact =
        json['contact'] != null ? new ContactModel.fromJson(json['contact']) : null;
    invoiceUrl = json['invoice_url'];
    paymentLink = json['payment_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['location_id'] = this.locationId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['is_quotation'] = this.isQuotation;
    data['payment_status'] = this.paymentStatus;
    data['contact_id'] = this.contactId;
    data['invoice_no'] = this.invoiceNo;
    data['ref_no'] = this.refNo;
    data['transaction_date'] = this.transactionDate;
    data['total_before_tax'] = this.totalBeforeTax;
    data['tax_amount'] = this.taxAmount;
    data['discount_type'] = this.discountType;
    data['discount_amount'] = this.discountAmount;
    data['rp_redeemed'] = this.rpRedeemed;
    data['rp_redeemed_amount'] = this.rpRedeemedAmount;
    data['shipping_details'] = this.shippingDetails;
    data['shipping_address'] = this.shippingAddress;
    data['delivery_date'] = this.deliveryDate;
    data['shipping_status'] = this.shippingStatus;
    data['delivered_to'] = this.deliveredTo;
    data['shipping_charges'] = this.shippingCharges;
    data['is_export'] = this.isExport;
    data['round_off_amount'] = this.roundOffAmount;
    data['final_total'] = this.finalTotal;
    data['exchange_rate'] = this.exchangeRate;
    data['created_by'] = this.createdBy;
    data['packing_charge'] = this.packingCharge;
    data['is_created_from_api'] = this.isCreatedFromApi;
    data['rp_earned'] = this.rpEarned;
    data['order_addresses'] = this.orderAddresses;
    data['is_recurring'] = this.isRecurring;
    data['recur_interval'] = this.recurInterval;
    data['recur_interval_type'] = this.recurIntervalType;
    data['recur_repetitions'] = this.recurRepetitions;
    data['invoice_token'] = this.invoiceToken;
    if (this.sellLines != null) {
      data['sell_lines'] = this.sellLines!.map((v) => v.toJson()).toList();
    }
    if (this.paymentLines != null) {
      data['payment_lines'] =
          this.paymentLines!.map((v) => v.toJson()).toList();
    }
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    data['invoice_url'] = this.invoiceUrl;
    data['payment_link'] = this.paymentLink;
    return data;
  }
}
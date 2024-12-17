class PaymentLinesModel {
  int? id;
  int? transactionId;
  int? businessId;
  int? isReturn;
  String? amount;
  String? method;
  String? paymentType;
  String? transactionNo;
  String? cardTransactionNumber;
  String? cardNumber;
  String? cardType;
  String? cardHolderName;
  String? cardMonth;
  String? cardYear;
  String? cardSecurity;
  String? chequeNumber;
  String? bankAccountNumber;
  String? paidOn;
  int? createdBy;
  int? paidThroughLink;
  int? isAdvance;
  int? paymentFor;
  String? paymentRefNo;
  int? accountId;

  PaymentLinesModel(
      {this.id,
      this.transactionId,
      this.businessId,
      this.isReturn,
      this.amount,
      this.method,
      this.paymentType,
      this.transactionNo,
      this.cardTransactionNumber,
      this.cardNumber,
      this.cardType,
      this.cardHolderName,
      this.cardMonth,
      this.cardYear,
      this.cardSecurity,
      this.chequeNumber,
      this.bankAccountNumber,
      this.paidOn,
      this.createdBy,
      this.paidThroughLink,
      this.isAdvance,
      this.paymentFor,
      this.paymentRefNo,
      this.accountId
      });

  PaymentLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction_id'];
    businessId = json['business_id'];
    isReturn = json['is_return'];
    amount = json['amount'];
    method = json['method'];
    paymentType = json['payment_type'];
    transactionNo = json['transaction_no'];
    cardTransactionNumber = json['card_transaction_number'];
    cardNumber = json['card_number'];
    cardType = json['card_type'];
    cardHolderName = json['card_holder_name'];
    cardMonth = json['card_month'];
    cardYear = json['card_year'];
    cardSecurity = json['card_security'];
    chequeNumber = json['cheque_number'];
    bankAccountNumber = json['bank_account_number'];
    paidOn = json['paid_on'];
    createdBy = json['created_by'];
    paidThroughLink = json['paid_through_link'];
    isAdvance = json['is_advance'];
    paymentFor = json['payment_for'];
    paymentRefNo = json['payment_ref_no'];
    accountId = json['account_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction_id'] = this.transactionId;
    data['business_id'] = this.businessId;
    data['is_return'] = this.isReturn;
    data['amount'] = this.amount;
    data['method'] = this.method;
    data['payment_type'] = this.paymentType;
    data['transaction_no'] = this.transactionNo;
    data['card_transaction_number'] = this.cardTransactionNumber;
    data['card_number'] = this.cardNumber;
    data['card_type'] = this.cardType;
    data['card_holder_name'] = this.cardHolderName;
    data['card_month'] = this.cardMonth;
    data['card_year'] = this.cardYear;
    data['card_security'] = this.cardSecurity;
    data['cheque_number'] = this.chequeNumber;
    data['bank_account_number'] = this.bankAccountNumber;
    data['paid_on'] = this.paidOn;
    data['created_by'] = this.createdBy;
    data['paid_through_link'] = this.paidThroughLink;
    data['is_advance'] = this.isAdvance;
    data['payment_for'] = this.paymentFor;
    data['payment_ref_no'] = this.paymentRefNo;
    data['account_id'] = this.accountId;
    return data;
  }
}
class ContactModel {
  int? id;
  int? businessId;
  String? supplierBusinessName;
  String? type;
  String? name;
  String? firstName;
  String? mobil;
  String? carNumber;
  String? carBrand;
  String? contactId;
  String? contactStatus;
  String? balance;
  int? isDefault;
  int? isExport;

  ContactModel(
      {this.id,
      this.businessId,
      this.supplierBusinessName,
      this.type,
      this.name,
      this.firstName,
      this.mobil,
      this.carNumber,
      this.carBrand,
      this.contactId,
      this.contactStatus,
      this.balance,
      this.isDefault,
      this.isExport});

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    supplierBusinessName = json['supplier_business_name'];
    type = json['type'];
    name = json['name'];
    firstName = json['first_name'];
    mobil = json['mobil'];
    carNumber = json['custom_field1'];
    carBrand = json['custom_field2'];
    contactId = json['contact_id'];
    contactStatus = json['contact_status'];
    balance = json['balance'];
    isDefault = json['is_default'];
    isExport = json['is_export'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['supplier_business_name'] = this.supplierBusinessName;
    data['type'] = this.type;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['mobil'] = this.mobil;
    data['custom_field1'] = this.carNumber;
    data['custom_field2'] = this.carBrand;
    data['contact_id'] = this.contactId;
    data['contact_status'] = this.contactStatus;
    data['balance'] = this.balance;
    data['is_default'] = this.isDefault;
    data['is_export'] = this.isExport;
    return data;
  }
}

class PurchaseModel {
  String id;
  String companyName;
  String companyPhone;
  String goodType;
  int quantity;
  int rateFixed;
  String paymentType;
  int total;
  String status;
  String createdAt;

  PurchaseModel(
      {this.id,
      this.companyName,
      this.companyPhone,
      this.goodType,
      this.quantity,
      this.rateFixed,
      this.paymentType,
      this.total,
      this.status,
      this.createdAt});

  String get getId => this.id;
  String get getCompanyName => this.companyName;
  String get getCompanyPhone => this.companyPhone;
  String get getGoodType => this.goodType;
  int get getQuantity => this.quantity;
  int get getRateFixed => this.rateFixed;
  String get getPaymentType => this.paymentType;
  int get getTotal => this.total;
  String get getStatus => this.status;
  String get getCreatedAt => this.createdAt;

  set setId(String id) => this.id = id;

  set setCompanyName(String companyName) => this.companyName = companyName;
  set setCompanyPhone(String companyPhone) => this.companyPhone = companyPhone;
  set setGoodType(String goodType) => this.goodType = goodType;
  set setQuantity(int quantity) => this.quantity = quantity;
  set setRateFixed(int rateFixed) => this.rateFixed = rateFixed;
  set setPaymentType(String paymentType) => this.paymentType = paymentType;
  set setTotal(int total) => this.total = total;
  set setStatus(String status) => this.status = status;
  set setCreatedAt(String createdAt) => this.createdAt = createdAt;

  @override
  String toString() => 'Purchase { companyName: $companyName }';
}

class SaleModel {
  String id;
  String customerName;
  String customerPhone;
  String goodType;
  int quantity;
  int rateFixed;
  String paymentType;
  int total;
  String status;
  String createdAt;

  SaleModel(
      {this.id,
      this.customerName,
      this.customerPhone,
      this.goodType,
      this.quantity,
      this.rateFixed,
      this.paymentType,
      this.total,
      this.status,
      this.createdAt});

  String get getId => this.id;
  String get getCustomerName => this.customerName;
  String get getCustomerPhone => this.customerPhone;
  String get getGoodType => this.goodType;
  int get getQuantity => this.quantity;
  int get getRateFixed => this.rateFixed;
  String get getPaymentType => this.paymentType;
  int get getTotal => this.total;
  String get getStatus => this.status;
  String get getCreatedAt => this.createdAt;

  set setId(String id) => this.id = id;

  set setCustomerName(String customerName) => this.customerName = customerName;
  set setCustomerPhone(String customerPhone) =>
      this.customerPhone = customerPhone;
  set setGoodType(String goodType) => this.goodType = goodType;
  set setQuantity(int quantity) => this.quantity = quantity;
  set setRateFixed(int rateFixed) => this.rateFixed = rateFixed;
  set setPaymentType(String paymentType) => this.paymentType = paymentType;
  set setTotal(int total) => this.total = total;
  set setStatus(String status) => this.status = status;
  set setCreatedAt(String createdAt) => this.createdAt = createdAt;

  @override
  String toString() => 'Sale { customerName: $customerName }';
}

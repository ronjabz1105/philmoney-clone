import 'package:cloud_firestore/cloud_firestore.dart';

class RemittanceModel {
  String? id;
  String referrenceNumber;

  ModeOfPaymentModel modeOfPayment;
  String rate;
  String date;
  String paymentDeadLine;
  String purpose;
  String receiverId;
  String amountSend;
  String amountReceive;
  String discount;
  String serviceFee;
  String totalAmount;
  String status;
  int txnStatus;

  RemittanceModel({
    this.id,
    required this.referrenceNumber,
    required this.modeOfPayment,
    required this.rate,
    required this.date,
    required this.paymentDeadLine,
    required this.purpose,
    required this.receiverId,
    required this.amountSend,
    required this.discount,
    required this.serviceFee,
    required this.totalAmount,
    required this.amountReceive,
    required this.status,
    required this.txnStatus,
  });

  RemittanceModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        referrenceNumber = snapshot['referrence_number'],
        purpose = snapshot['purpose'],
        receiverId = snapshot['receiver_id'],
        amountSend = snapshot['amount_send'],
        amountReceive = snapshot['amount_receive'],
        discount = snapshot['discount'],
        serviceFee = snapshot['service_fee'],
        totalAmount = snapshot['total_amount'],
        status = snapshot['status'],
        txnStatus = snapshot['txn_status'],
        rate = snapshot['rate'],
        date = snapshot['date'],
        paymentDeadLine = snapshot['payment_deadline'],
        modeOfPayment =
            ModeOfPaymentModel.fromJson(snapshot['mode_of_payment']);

  // ReceiverModel.fromJson(Map<String, dynamic> json)
  RemittanceModel.fromJson(Map<String, dynamic> json)
      : // id = json.id,
        referrenceNumber = json['referrence_number'],
        purpose = json['purpose'],
        receiverId = json['receiver_id'],
        amountSend = json['amount_send'],
        amountReceive = json['amount_receive'],
        discount = json['discount'],
        serviceFee = json['service_fee'],
        totalAmount = json['total_amount'],
        status = json['status'],
        txnStatus = json['txn_status'],
        rate = json['rate'],
        date = json['date'],
        paymentDeadLine = json['payment_deadline'],
        modeOfPayment = ModeOfPaymentModel.fromJson(json['mode_of_payment']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['referrence_number'] = referrenceNumber;
    data['puropose'] = purpose;
    data['receiver_id'] = receiverId;
    data['amount_send'] = amountSend;
    data['amount_receive'] = amountReceive;
    data['discount'] = discount;
    data['service_fee'] = serviceFee;
    data['total_amount'] = totalAmount;
    data['status'] = status;
    data['txn_status'] = txnStatus;
    data['mode_of_payment'] = modeOfPayment;
    data['rate'] = rate;
    data['date'] = date;
    data['payment_deadline'] = paymentDeadLine;
    return data;
  }
}

class ModeOfPaymentModel {
  String storeName;
  String icon;
  String barcode1;
  String barcode2;
  String barcode3;

  ModeOfPaymentModel({
    required this.storeName,
    required this.icon,
    required this.barcode1,
    required this.barcode2,
    required this.barcode3,
  });

  ModeOfPaymentModel.fromJson(Map<String, dynamic> json)
      : storeName = json['store_name'],
        icon = json['icon_path'],
        barcode1 = json['barcode1'],
        barcode2 = json['barcode2'],
        barcode3 = json['barcode3'];

  ModeOfPaymentModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : storeName = snapshot['store_name'] as String,
        icon = snapshot['icon_path'] as String,
        barcode1 = snapshot['barcode1'] as String,
        barcode2 = snapshot['barcode2'] as String,
        barcode3 = snapshot['barcode3'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store_name'] = storeName;
    data['icon_path'] = icon;
    data['barcode1'] = barcode1;
    data['barcode2'] = barcode2;
    data['barcode3'] = barcode3;

    return data;
  }
}

class GetWalletTransactionModel {
  String? status;
  String? message;
  List<GetWalletTransactionResult>? result;
  String? token;

  GetWalletTransactionModel(
      {this.status, this.message, this.result, this.token});

  GetWalletTransactionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <GetWalletTransactionResult>[];
      json['result'].forEach((v) {
        result!.add(GetWalletTransactionResult.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    return data;
  }
}

class GetWalletTransactionResult {
  String? walTraId;
  String? walTraServiceType;
  String? walTraStartingBalance;
  String? walTraEndingBalance;
  String? walTraUsersId;
  String? walTraTransactionReference;
  String? walTraTransactionType;
  String? walTraMessage;
  String? walTraWalletTransactionUfitpayCallbackId;
  String? walTraTransactionDate;
  String? walTraCustomerAccountId;
  String? walTraDescription;
  String? walTraCustomerEmail;
  String? walTraCustomerName;
  String? walTraTransactionValue;
  String? walTraTransactionFee;
  String? walTraServiceCode;
  String? walTraSessionId;
  String? walTraCreditAccountNumber;
  String? walTraRequestRef;
  String? walTraCreatedAt;
  String? walTraUpdatedAt;
  String? walTraDeletedAt;
  String? walTraSenderId;
  String? walTraReceiverId;
  String? walTraBuyResource;
  String? walTraBuyStatus;
  String? walTraBuyDataPaymentStatus;
  String? walTraBuyDataReference;
  String? walTraBuyDataCost;
  String? walTraBuyDataToken;
  String? walTraBuyDataSerial;
  String? walTraTransactionAppFee;
  String? walTraBuyPostServiceId;
  String? walTraBuyPostVendorId;
  String? walTraBuyPostPackageId;
  String? walTraBuyPostAccountNumber;
  String? walTraBuyPostAmount;
  String? walTraBuyPostRequestRef;
  String? walTraVirtualCardNo;
  String? walTraVirtualCardResource;
  String? walTraVirtualCardStatus;
  String? walTraVirtualCardId;
  String? walTraVirtualCardBalance;
  String? walTraCurrency;

  GetWalletTransactionResult(
      {this.walTraId,
      this.walTraServiceType,
      this.walTraStartingBalance,
      this.walTraEndingBalance,
      this.walTraUsersId,
      this.walTraTransactionReference,
      this.walTraTransactionType,
      this.walTraMessage,
      this.walTraWalletTransactionUfitpayCallbackId,
      this.walTraTransactionDate,
      this.walTraCustomerAccountId,
      this.walTraDescription,
      this.walTraCustomerEmail,
      this.walTraCustomerName,
      this.walTraTransactionValue,
      this.walTraTransactionFee,
      this.walTraServiceCode,
      this.walTraSessionId,
      this.walTraCreditAccountNumber,
      this.walTraRequestRef,
      this.walTraCreatedAt,
      this.walTraUpdatedAt,
      this.walTraDeletedAt,
      this.walTraSenderId,
      this.walTraReceiverId,
      this.walTraBuyResource,
      this.walTraBuyStatus,
      this.walTraBuyDataPaymentStatus,
      this.walTraBuyDataReference,
      this.walTraBuyDataCost,
      this.walTraBuyDataToken,
      this.walTraBuyDataSerial,
      this.walTraTransactionAppFee,
      this.walTraBuyPostServiceId,
      this.walTraBuyPostVendorId,
      this.walTraBuyPostPackageId,
      this.walTraBuyPostAccountNumber,
      this.walTraBuyPostAmount,
      this.walTraBuyPostRequestRef,
      this.walTraVirtualCardNo,
      this.walTraVirtualCardResource,
      this.walTraVirtualCardStatus,
      this.walTraVirtualCardId,
      this.walTraVirtualCardBalance,
      this.walTraCurrency});

  GetWalletTransactionResult.fromJson(Map<String, dynamic> json) {
    walTraId = json['wal_tra_id'];
    walTraServiceType = json['wal_tra_service_type'];
    walTraStartingBalance = json['wal_tra_starting_balance'];
    walTraEndingBalance = json['wal_tra_ending_balance'];
    walTraUsersId = json['wal_tra_users_id'];
    walTraTransactionReference = json['wal_tra_transaction_reference'];
    walTraTransactionType = json['wal_tra_transaction_type'];
    walTraMessage = json['wal_tra_message'];
    walTraWalletTransactionUfitpayCallbackId =
        json['wal_tra_wallet_transaction_ufitpay_callback_id'];
    walTraTransactionDate = json['wal_tra_transaction_date'];
    walTraCustomerAccountId = json['wal_tra_customer_account_id'];
    walTraDescription = json['wal_tra_description'];
    walTraCustomerEmail = json['wal_tra_customer_email'];
    walTraCustomerName = json['wal_tra_customer_name'];
    walTraTransactionValue = json['wal_tra_transaction_value'];
    walTraTransactionFee = json['wal_tra_transaction_fee'];
    walTraServiceCode = json['wal_tra_service_code'];
    walTraSessionId = json['wal_tra_session_id'];
    walTraCreditAccountNumber = json['wal_tra_credit_account_number'];
    walTraRequestRef = json['wal_tra_request_ref'];
    walTraCreatedAt = json['wal_tra_created_at'];
    walTraUpdatedAt = json['wal_tra_updated_at'];
    walTraDeletedAt = json['wal_tra_deleted_at'];
    walTraSenderId = json['wal_tra_sender_id'];
    walTraReceiverId = json['wal_tra_receiver_id'];
    walTraBuyResource = json['wal_tra_buy_resource'];
    walTraBuyStatus = json['wal_tra_buy_status'];
    walTraBuyDataPaymentStatus = json['wal_tra_buy_data_payment_status'];
    walTraBuyDataReference = json['wal_tra_buy_data_reference'];
    walTraBuyDataCost = json['wal_tra_buy_data_cost'];
    walTraBuyDataToken = json['wal_tra_buy_data_token'];
    walTraBuyDataSerial = json['wal_tra_buy_data_serial'];
    walTraTransactionAppFee = json['wal_tra_transaction_app_fee'];
    walTraBuyPostServiceId = json['wal_tra_buy_post_service_id'];
    walTraBuyPostVendorId = json['wal_tra_buy_post_vendor_id'];
    walTraBuyPostPackageId = json['wal_tra_buy_post_package_id'];
    walTraBuyPostAccountNumber = json['wal_tra_buy_post_account_number'];
    walTraBuyPostAmount = json['wal_tra_buy_post_amount'];
    walTraBuyPostRequestRef = json['wal_tra_buy_post_request_ref'];
    walTraVirtualCardNo = json['wal_tra_virtual_card_no'];
    walTraVirtualCardResource = json['wal_tra_virtual_card_resource'];
    walTraVirtualCardStatus = json['wal_tra_virtual_card_status'];
    walTraVirtualCardId = json['wal_tra_virtual_card_id'];
    walTraVirtualCardBalance = json['wal_tra_virtual_card_balance'];
    walTraCurrency = json['wal_tra_currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wal_tra_id'] = walTraId;
    data['wal_tra_service_type'] = walTraServiceType;
    data['wal_tra_starting_balance'] = walTraStartingBalance;
    data['wal_tra_ending_balance'] = walTraEndingBalance;
    data['wal_tra_users_id'] = walTraUsersId;
    data['wal_tra_transaction_reference'] = walTraTransactionReference;
    data['wal_tra_transaction_type'] = walTraTransactionType;
    data['wal_tra_message'] = walTraMessage;
    data['wal_tra_wallet_transaction_ufitpay_callback_id'] =
        walTraWalletTransactionUfitpayCallbackId;
    data['wal_tra_transaction_date'] = walTraTransactionDate;
    data['wal_tra_customer_account_id'] = walTraCustomerAccountId;
    data['wal_tra_description'] = walTraDescription;
    data['wal_tra_customer_email'] = walTraCustomerEmail;
    data['wal_tra_customer_name'] = walTraCustomerName;
    data['wal_tra_transaction_value'] = walTraTransactionValue;
    data['wal_tra_transaction_fee'] = walTraTransactionFee;
    data['wal_tra_service_code'] = walTraServiceCode;
    data['wal_tra_session_id'] = walTraSessionId;
    data['wal_tra_credit_account_number'] = walTraCreditAccountNumber;
    data['wal_tra_request_ref'] = walTraRequestRef;
    data['wal_tra_created_at'] = walTraCreatedAt;
    data['wal_tra_updated_at'] = walTraUpdatedAt;
    data['wal_tra_deleted_at'] = walTraDeletedAt;
    data['wal_tra_sender_id'] = walTraSenderId;
    data['wal_tra_receiver_id'] = walTraReceiverId;
    data['wal_tra_buy_resource'] = walTraBuyResource;
    data['wal_tra_buy_status'] = walTraBuyStatus;
    data['wal_tra_buy_data_payment_status'] = walTraBuyDataPaymentStatus;
    data['wal_tra_buy_data_reference'] = walTraBuyDataReference;
    data['wal_tra_buy_data_cost'] = walTraBuyDataCost;
    data['wal_tra_buy_data_token'] = walTraBuyDataToken;
    data['wal_tra_buy_data_serial'] = walTraBuyDataSerial;
    data['wal_tra_transaction_app_fee'] = walTraTransactionAppFee;
    data['wal_tra_buy_post_service_id'] = walTraBuyPostServiceId;
    data['wal_tra_buy_post_vendor_id'] = walTraBuyPostVendorId;
    data['wal_tra_buy_post_package_id'] = walTraBuyPostPackageId;
    data['wal_tra_buy_post_account_number'] = walTraBuyPostAccountNumber;
    data['wal_tra_buy_post_amount'] = walTraBuyPostAmount;
    data['wal_tra_buy_post_request_ref'] = walTraBuyPostRequestRef;
    data['wal_tra_virtual_card_no'] = walTraVirtualCardNo;
    data['wal_tra_virtual_card_resource'] = walTraVirtualCardResource;
    data['wal_tra_virtual_card_status'] = walTraVirtualCardStatus;
    data['wal_tra_virtual_card_id'] = walTraVirtualCardId;
    data['wal_tra_virtual_card_balance'] = walTraVirtualCardBalance;
    data['wal_tra_currency'] = walTraCurrency;
    return data;
  }
}

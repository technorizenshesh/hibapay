import 'package:HibaPay/app/data/apis/api_models/get_banners_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_transactions_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_services_hibapay_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_wallet_transaction_model.dart';
import 'package:HibaPay/app/data/apis/api_models/list_virtual_cards_model.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:get/get.dart';

final selectedIndex = 0.obs;
final selectedValue = 0.obs;
final isValue = false.obs;
// String cur = "₦";

List<GetServicesResult> getServicesResult = [];
List<GetBannersResult> getBannersResult = [];
List<GetCardTransactionsResultData> getCardTransactionsResultData = [];
List<ListVirtualCardsResult> listVirtualCardsResult = [];
List<GetWalletTransactionResult> getWalletTransactionResult = [];

Result? result;

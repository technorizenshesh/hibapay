import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/add_bank_account/bindings/add_bank_account_binding.dart';
import '../modules/add_bank_account/views/add_bank_account_view.dart';
import '../modules/add_new_bank/bindings/add_new_bank_binding.dart';
import '../modules/add_new_bank/views/add_new_bank_view.dart';
import '../modules/add_new_card/bindings/add_new_card_binding.dart';
import '../modules/add_new_card/views/add_new_card_view.dart';
import '../modules/all_transactions/bindings/all_transactions_binding.dart';
import '../modules/all_transactions/views/all_transactions_view.dart';
import '../modules/betting/bindings/betting_binding.dart';
import '../modules/betting/views/betting_view.dart';
import '../modules/bil_payment/bindings/bil_payment_binding.dart';
import '../modules/bil_payment/views/bil_payment_view.dart';
import '../modules/bil_payment_submit/bindings/bil_payment_submit_binding.dart';
import '../modules/bil_payment_submit/views/bil_payment_submit_view.dart';
import '../modules/bil_payment_success/bindings/bil_payment_success_binding.dart';
import '../modules/bil_payment_success/views/bil_payment_success_view.dart';
import '../modules/cable_tv/bindings/cable_tv_binding.dart';
import '../modules/cable_tv/views/cable_tv_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/check_your_mail/bindings/check_your_mail_binding.dart';
import '../modules/check_your_mail/views/check_your_mail_view.dart';
import '../modules/create_new_password/bindings/create_new_password_binding.dart';
import '../modules/create_new_password/views/create_new_password_view.dart';
import '../modules/create_your_smartpay_card/bindings/create_your_smartpay_card_binding.dart';
import '../modules/create_your_smartpay_card/views/create_your_smartpay_card_view.dart';
import '../modules/deposit/bindings/deposit_binding.dart';
import '../modules/deposit/views/deposit_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/electricity/bindings/electricity_binding.dart';
import '../modules/electricity/views/electricity_view.dart';
import '../modules/faqs/bindings/faqs_binding.dart';
import '../modules/faqs/views/faqs_view.dart';
import '../modules/general_setting/bindings/general_setting_binding.dart';
import '../modules/general_setting/views/general_setting_view.dart';
import '../modules/gift_user/bindings/gift_user_binding.dart';
import '../modules/gift_user/views/gift_user_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';
import '../modules/my_card/bindings/my_card_binding.dart';
import '../modules/my_card/views/my_card_view.dart';
import '../modules/my_profile/bindings/my_profile_binding.dart';
import '../modules/my_profile/views/my_profile_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/pay_amount/bindings/pay_amount_binding.dart';
import '../modules/pay_amount/views/pay_amount_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/rate_us/bindings/rate_us_binding.dart';
import '../modules/rate_us/views/rate_us_view.dart';
import '../modules/receiving_account/bindings/receiving_account_binding.dart';
import '../modules/receiving_account/views/receiving_account_view.dart';
import '../modules/recharge/bindings/recharge_binding.dart';
import '../modules/recharge/views/recharge_view.dart';
import '../modules/rent/bindings/rent_binding.dart';
import '../modules/rent/views/rent_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/reward_points/bindings/reward_points_binding.dart';
import '../modules/reward_points/views/reward_points_view.dart';
import '../modules/scan_qr_code/bindings/scan_qr_code_binding.dart';
import '../modules/scan_qr_code/views/scan_qr_code_view.dart';
import '../modules/send_money/bindings/send_money_binding.dart';
import '../modules/send_money/views/send_money_view.dart';
import '../modules/send_money_successfully/bindings/send_money_successfully_binding.dart';
import '../modules/send_money_successfully/views/send_money_successfully_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/spinner/bindings/spinner_binding.dart';
import '../modules/spinner/views/spinner_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/transfer/bindings/transfer_binding.dart';
import '../modules/transfer/views/transfer_view.dart';
import '../modules/verify_identity/bindings/verify_identity_binding.dart';
import '../modules/verify_identity/views/verify_identity_view.dart';
import '../modules/verify_identity_success/bindings/verify_identity_success_binding.dart';
import '../modules/verify_identity_success/views/verify_identity_success_view.dart';
import '../modules/wallet/bindings/wallet_binding.dart';
import '../modules/wallet/views/wallet_view.dart';
import '../modules/withdraw/bindings/withdraw_binding.dart';
import '../modules/withdraw/views/withdraw_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAV_BAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_YOUR_MAIL,
      page: () => const CheckYourMailView(),
      binding: CheckYourMailBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NEW_PASSWORD,
      page: () => const CreateNewPasswordView(),
      binding: CreateNewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE,
      page: () => const MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: _Paths.RATE_US,
      page: () => const RateUsView(),
      binding: RateUsBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.MY_CARD,
      page: () => const MyCardView(),
      binding: MyCardBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_QR_CODE,
      page: () => const ScanQrCodeView(),
      binding: ScanQrCodeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_CARD,
      page: () => const AddNewCardView(),
      binding: AddNewCardBinding(),
    ),
    GetPage(
      name: _Paths.GENERAL_SETTING,
      page: () => const GeneralSettingView(),
      binding: GeneralSettingBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_BANK,
      page: () => const AddNewBankView(),
      binding: AddNewBankBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER,
      page: () => const TransferView(),
      binding: TransferBinding(),
    ),
    GetPage(
      name: _Paths.SEND_MONEY,
      page: () => const SendMoneyView(),
      binding: SendMoneyBinding(),
    ),
    GetPage(
      name: _Paths.WITHDRAW,
      page: () => const WithdrawView(),
      binding: WithdrawBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BANK_ACCOUNT,
      page: () => const AddBankAccountView(),
      binding: AddBankAccountBinding(),
    ),
    GetPage(
      name: _Paths.SEND_MONEY_SUCCESSFULLY,
      page: () => const SendMoneySuccessfullyView(),
      binding: SendMoneySuccessfullyBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => const MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.ELECTRICITY,
      page: () => const ElectricityView(),
      binding: ElectricityBinding(),
    ),
    GetPage(
      name: _Paths.RECHARGE,
      page: () => const RechargeView(),
      binding: RechargeBinding(),
    ),
    GetPage(
      name: _Paths.BIL_PAYMENT,
      page: () => const BilPaymentView(),
      binding: BilPaymentBinding(),
    ),
    GetPage(
      name: _Paths.BIL_PAYMENT_SUBMIT,
      page: () => const BilPaymentSubmitView(),
      binding: BilPaymentSubmitBinding(),
    ),
    GetPage(
      name: _Paths.BIL_PAYMENT_SUCCESS,
      page: () => const BilPaymentSuccessView(),
      binding: BilPaymentSuccessBinding(),
    ),
    GetPage(
      name: _Paths.RENT,
      page: () => const RentView(),
      binding: RentBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.ALL_TRANSACTIONS,
      page: () => const AllTransactionsView(),
      binding: AllTransactionsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_YOUR_SMARTPAY_CARD,
      page: () => const CreateYourSmartpayCardView(),
      binding: CreateYourSmartpayCardBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_IDENTITY,
      page: () => const VerifyIdentityView(),
      binding: VerifyIdentityBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_IDENTITY_SUCCESS,
      page: () => const VerifyIdentitySuccessView(),
      binding: VerifyIdentitySuccessBinding(),
    ),
    GetPage(
      name: _Paths.PAY_AMOUNT,
      page: () => const PayAmountView(),
      binding: PayAmountBinding(),
    ),
    GetPage(
      name: _Paths.FAQS,
      page: () => const FaqsView(),
      binding: FaqsBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => const WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.RECEIVING_ACCOUNT,
      page: () => const ReceivingAccountView(),
      binding: ReceivingAccountBinding(),
    ),
    GetPage(
      name: _Paths.DEPOSIT,
      page: () => const DepositView(),
      binding: DepositBinding(),
    ),
    GetPage(
      name: _Paths.SPINNER,
      page: () => const SpinnerView(),
      binding: SpinnerBinding(),
    ),
    GetPage(
      name: _Paths.REWARD_POINTS,
      page: () => const RewardPointsView(),
      binding: RewardPointsBinding(),
    ),
    GetPage(
      name: _Paths.GIFT_USER,
      page: () => const GiftUserView(),
      binding: GiftUserBinding(),
    ),
    GetPage(
      name: _Paths.BETTING,
      page: () => const BettingView(),
      binding: BettingBinding(),
    ),
    GetPage(
      name: _Paths.CABLE_TV,
      page: () => const CableTvView(),
      binding: CableTvBinding(),
    ),
  ];
}

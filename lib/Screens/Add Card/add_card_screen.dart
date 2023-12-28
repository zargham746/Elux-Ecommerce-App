// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_elux_app/Widgets/leading_iconbutton.dart';

import '../../config/constants.dart';
import 'components/components.dart';

class AddCardScreen extends StatefulWidget {
  static const String routeName = '/add_card';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AddCardScreen(),
    );
  }

  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border, errorborder;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.r),
      ),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 1.0,
      ),
    );
    errorborder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.r),
      ),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIconButton(),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              child: Text(
                'Payment',
                style: defaultStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  fontSize: 22.sp,
                ),
              ),
            ),
            CreditCardWidget(
              glassmorphismConfig:
                  useGlassMorphism ? Glassmorphism.defaultConfig() : null,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: '',
              frontCardBorder:
                  !useGlassMorphism ? Border.all(color: Colors.grey) : null,
              backCardBorder:
                  !useGlassMorphism ? Border.all(color: Colors.grey) : null,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.black,
              backgroundImage: useBackgroundImage ? 'assets/card_bg.png' : null,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    'assets/icons/mastercard.png',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.black,
                      textColor: Colors.grey,
                      cardNumberDecoration: InputDecoration(
                        errorBorder: errorborder,
                        focusedErrorBorder: errorborder,
                        border: border,
                        disabledBorder: border,
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                        errorBorder: errorborder,
                        focusedErrorBorder: errorborder,
                        border: border,
                        disabledBorder: border,
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Expire Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                        errorBorder: errorborder,
                        focusedErrorBorder: errorborder,
                        border: border,
                        disabledBorder: border,
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                        errorBorder: errorborder,
                        focusedErrorBorder: errorborder,
                        border: border,
                        disabledBorder: border,
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder Name',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: _onValidate,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          'Validate',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      showDialog(
          barrierColor: Colors.black54,
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return const ValidationContainer(
              icon: Icons.check_circle,
              iconColor: Colors.green,
              text: 'Successful!',
              description: "Your Card has been added\nSuccessfully",
              buttonTitle: 'Continue Shopping',
            );
          });
    } else {
      const ValidationContainer(
        icon: Icons.cancel_rounded,
        iconColor: Colors.red,
        text: 'Unsuccessful!',
        description: "Check your credentials and \ntry again",
        buttonTitle: 'Try Again',
      );
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

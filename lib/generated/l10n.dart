// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Manager`
  String get account_title {
    return Intl.message(
      'Manager',
      name: 'account_title',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get username {
    return Intl.message(
      'UserName',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signup {
    return Intl.message(
      'SignUp',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account`
  String get dontHaveAccount {
    return Intl.message(
      'Don`t have account',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Have account ? `
  String get haveAccount {
    return Intl.message(
      'Have account ? ',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `POS`
  String get pos {
    return Intl.message(
      'POS',
      name: 'pos',
      desc: '',
      args: [],
    );
  }

  /// `PIN`
  String get pin {
    return Intl.message(
      'PIN',
      name: 'pin',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invoice`
  String get invoice {
    return Intl.message(
      'Invoice',
      name: 'invoice',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `After Tax`
  String get afterTax {
    return Intl.message(
      'After Tax',
      name: 'afterTax',
      desc: '',
      args: [],
    );
  }

  /// `Tax`
  String get tax {
    return Intl.message(
      'Tax',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `orders`
  String get orders {
    return Intl.message(
      'orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `canceld`
  String get canceld {
    return Intl.message(
      'canceld',
      name: 'canceld',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Invoices Settings`
  String get invoiceSettings {
    return Intl.message(
      'Invoices Settings',
      name: 'invoiceSettings',
      desc: '',
      args: [],
    );
  }

  /// `printers`
  String get printers {
    return Intl.message(
      'printers',
      name: 'printers',
      desc: '',
      args: [],
    );
  }

  /// `themes`
  String get themes {
    return Intl.message(
      'themes',
      name: 'themes',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message(
      'Owner',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get cusotmer {
    return Intl.message(
      'Customer',
      name: 'cusotmer',
      desc: '',
      args: [],
    );
  }

  /// `Sections`
  String get sections {
    return Intl.message(
      'Sections',
      name: 'sections',
      desc: '',
      args: [],
    );
  }

  /// `SAR`
  String get saudiaCurrency {
    return Intl.message(
      'SAR',
      name: 'saudiaCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Print`
  String get print {
    return Intl.message(
      'Print',
      name: 'print',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to Print this?`
  String get printingAlert {
    return Intl.message(
      'Would you like to Print this?',
      name: 'printingAlert',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// ` It Can't Be Empty`
  String get notNull {
    return Intl.message(
      ' It Can`t Be Empty',
      name: 'notNull',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get customer {
    return Intl.message(
      'Customer',
      name: 'customer',
      desc: '',
      args: [],
    );
  }

  /// `phone`
  String get phone {
    return Intl.message(
      'phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Recent Customers`
  String get recentCustomers {
    return Intl.message(
      'Recent Customers',
      name: 'recentCustomers',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get item {
    return Intl.message(
      'Item',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `Payment Ways`
  String get paymentWays {
    return Intl.message(
      'Payment Ways',
      name: 'paymentWays',
      desc: '',
      args: [],
    );
  }

  /// `Printing Page`
  String get printPage {
    return Intl.message(
      'Printing Page',
      name: 'printPage',
      desc: '',
      args: [],
    );
  }

  /// `Accounts`
  String get accounts {
    return Intl.message(
      'Accounts',
      name: 'accounts',
      desc: '',
      args: [],
    );
  }

  /// ` Total Order`
  String get requirePay {
    return Intl.message(
      ' Total Order',
      name: 'requirePay',
      desc: '',
      args: [],
    );
  }

  /// `Remaining For Customer`
  String get remaining {
    return Intl.message(
      'Remaining For Customer',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `Remaining To Cleint`
  String get remainingClient {
    return Intl.message(
      'Remaining To Cleint',
      name: 'remainingClient',
      desc: '',
      args: [],
    );
  }

  /// `Add Customer To Ticket`
  String get addCustomerToTicket {
    return Intl.message(
      'Add Customer To Ticket',
      name: 'addCustomerToTicket',
      desc: '',
      args: [],
    );
  }

  /// `Enter Value`
  String get entervalue {
    return Intl.message(
      'Enter Value',
      name: 'entervalue',
      desc: '',
      args: [],
    );
  }

  /// `Simple Tax Inoice`
  String get simpleTaxInvoice {
    return Intl.message(
      'Simple Tax Inoice',
      name: 'simpleTaxInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Tax Numer`
  String get taxNumber {
    return Intl.message(
      'Tax Numer',
      name: 'taxNumber',
      desc: '',
      args: [],
    );
  }

  /// `Total price With Vat`
  String get totalPriceWithVat {
    return Intl.message(
      'Total price With Vat',
      name: 'totalPriceWithVat',
      desc: '',
      args: [],
    );
  }

  /// `The due is Inclusive of Vat`
  String get totalPriceWithVat1 {
    return Intl.message(
      'The due is Inclusive of Vat',
      name: 'totalPriceWithVat1',
      desc: '',
      args: [],
    );
  }

  /// `Unit Price`
  String get unitPrice {
    return Intl.message(
      'Unit Price',
      name: 'unitPrice',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `UserName Or Password Wrong`
  String get authMessageFail {
    return Intl.message(
      'UserName Or Password Wrong',
      name: 'authMessageFail',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure ?`
  String get areSure {
    return Intl.message(
      'Are You Sure ?',
      name: 'areSure',
      desc: '',
      args: [],
    );
  }

  /// `Item Deleted`
  String get itemDeleted {
    return Intl.message(
      'Item Deleted',
      name: 'itemDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Cutomer Added`
  String get cutomerAdded {
    return Intl.message(
      'Cutomer Added',
      name: 'cutomerAdded',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get orderNumber {
    return Intl.message(
      'Order Number',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `New Order`
  String get newOrder {
    return Intl.message(
      'New Order',
      name: 'newOrder',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Branch`
  String get branch {
    return Intl.message(
      'Branch',
      name: 'branch',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Number`
  String get invoiceNumber {
    return Intl.message(
      'Invoice Number',
      name: 'invoiceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// ` THanks`
  String get invoiceEndMessage {
    return Intl.message(
      ' THanks',
      name: 'invoiceEndMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cash Cusotomer`
  String get cashCusotomer {
    return Intl.message(
      'Cash Cusotomer',
      name: 'cashCusotomer',
      desc: '',
      args: [],
    );
  }

  /// `there is no orders yet`
  String get noOrders {
    return Intl.message(
      'there is no orders yet',
      name: 'noOrders',
      desc: '',
      args: [],
    );
  }

  /// `Family Name`
  String get familyName {
    return Intl.message(
      'Family Name',
      name: 'familyName',
      desc: '',
      args: [],
    );
  }

  /// `Date / Time`
  String get dateTime {
    return Intl.message(
      'Date / Time',
      name: 'dateTime',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

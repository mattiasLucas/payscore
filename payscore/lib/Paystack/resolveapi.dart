import 'dart:convert';

import 'package:http/http.dart' as http;

class PaystackService {
  static const _baseUrl = 'https://api.paystack.co';
  static const _resolveBankAccountEndpoint = '/bank/resolve';
  static const _bankListEndpoint = '/bank';

  final String _secretKey;

  PaystackService(this._secretKey);

  Future<BankAccount> resolveBankAccount(
      String accountNumber, String bankCode) async {
    final url =
        '$_baseUrl$_resolveBankAccountEndpoint?account_number=$accountNumber&bank_code=$bankCode';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $_secretKey'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return BankAccount.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to resolve bank account: ${response.statusCode}');
    }
  }

  Future<List<Bank>> getBankList() async {
    final url = '$_baseUrl$_bankListEndpoint';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $_secretKey'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return (jsonResponse['data'] as List)
          .map((bankJson) => Bank.fromJson(bankJson))
          .toList();
    } else {
      throw Exception('Failed to get bank list: ${response.statusCode}');
    }
  }
}

class BankAccount {
  final String accountName;
  final String accountNumber;
  final String bankCode;
  final String bankName;

  BankAccount({
    required this.accountName,
    required this.accountNumber,
    required this.bankCode,
    required this.bankName,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      accountName: json['account_name'],
      accountNumber: json['account_number'],
      bankCode: json['bank_code'],
      bankName: json['bank_name'],
    );
  }
}

class Bank {
  final String id;
  final String name;
  final String slug;
  final String code;
  final String longcode;
  final bool gateway;
  final bool payWithBank;
  final bool isActive;
  final String country;

  Bank({
    required this.id,
    required this.name,
    required this.slug,
    required this.code,
    required this.longcode,
    required this.gateway,
    required this.payWithBank,
    required this.isActive,
    required this.country,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['id'].toString(),
      name: json['name'],
      slug: json['slug'],
      code: json['code'],
      longcode: json['longcode'],
      gateway: json['gateway'] == 'true',
      payWithBank: json['pay_with_bank'],
      isActive: json['is_active'],
      country: json['country'],
    );
  }
}

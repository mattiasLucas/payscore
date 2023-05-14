import 'dart:async';
import 'package:flutter/material.dart';
import 'package:payscore/Widgets/mybutton.dart';
import 'package:payscore/Paystack/resolveapi.dart';

class ResolveAccount extends StatefulWidget {
  const ResolveAccount({Key? key});

  @override
  State<ResolveAccount> createState() => _ResolveAccountState();
}

class _ResolveAccountState extends State<ResolveAccount> {
  final _accountNumberController = TextEditingController();
  late final PaystackService _paystackService;
  String _resolvedAccountName = '';
  String? _selectedBankCode;
  late Future<List<Bank>> _banksFuture;
  Timer? _debounceTimer;
  bool _isButtonEnabled =
      false; // Add a bool to track if the button should be enabled

  @override
  void initState() {
    super.initState();
    _paystackService =
        PaystackService('sk_test_7e196efbca0259e93bf62807ea8cce9819a3f6ca');
    _banksFuture = _paystackService.getBankList();
    _accountNumberController.addListener(_onAccountNumberChanged);
  }

  @override
  void dispose() {
    _accountNumberController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onAccountNumberChanged() {
    final accountNumber = _accountNumberController.text;

    if (_debounceTimer?.isActive == true) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (accountNumber.isNotEmpty && _selectedBankCode != null) {
        _onResolveAccountPressed();
      }
    });
  }

  void _onResolveAccountPressed() async {
    final accountNumber = _accountNumberController.text;

    try {
      final bankAccount = await _paystackService.resolveBankAccount(
          accountNumber, _selectedBankCode!);
      setState(() {
        _resolvedAccountName = bankAccount.accountName;
        _isButtonEnabled = true; // Enable the button
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20.0),
          TextFormField(
            controller: _accountNumberController,
            decoration: InputDecoration(labelText: 'Account Number'),
          ),
          FutureBuilder<List<Bank>>(
            future: _banksFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField<String>(
                  value: _selectedBankCode,
                  onChanged: (value) {
                    setState(() {
                      _selectedBankCode = value;
                      _onAccountNumberChanged(); // Trigger account resolution when bank code changes
                    });
                  },
                  items: snapshot.data!
                      .map<DropdownMenuItem<String>>((bank) => DropdownMenuItem(
                            value: bank.code,
                            child: Text(bank.name),
                          ))
                      .toList(),
                  decoration: InputDecoration(labelText: 'Bank'),
                );
              } else if (snapshot.hasError) {
                return Text('Error loading banks');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          if (_resolvedAccountName.isNotEmpty)
            Text('Resolved account name: $_resolvedAccountName'),
          ElevatedButton(
            onPressed: _isButtonEnabled
                ? () {
                    // Add code for when the button is pressed
                  }
                : null,
            child: Text('Button'),
          ),
        ],
      ),
    );
  }
}

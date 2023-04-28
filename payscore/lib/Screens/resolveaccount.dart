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

  @override
  void initState() {
    super.initState();
    _paystackService =
        PaystackService('sk_test_7e196efbca0259e93bf62807ea8cce9819a3f6ca');
    _banksFuture = _paystackService.getBankList();
  }

  @override
  void dispose() {
    _accountNumberController.dispose();
    super.dispose();
  }

  void _onResolveAccountPressed() async {
    final accountNumber = _accountNumberController.text;

    try {
      final bankAccount = await _paystackService.resolveBankAccount(
          accountNumber, _selectedBankCode!);
      setState(() {
        _resolvedAccountName = bankAccount.accountName;
      });
    } catch (e) {
      // handle error
      debugPrint(e as String?);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
          MyButton(
            buttonText: 'Resolve Account',
            onPressed: () {
              if (_selectedBankCode != null) {
                _onResolveAccountPressed();
              }
            },
          ),
          if (_resolvedAccountName.isNotEmpty)
            Text('Resolved account name: $_resolvedAccountName'),
        ],
      ),
    );
  }
}

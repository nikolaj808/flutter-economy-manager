import 'package:shared_preferences/shared_preferences.dart';

class Balance {

  Future<double> getBalance() async {
    final prefs = await SharedPreferences.getInstance();
    final startupBalance = prefs.getDouble('startupBalance');
    if (startupBalance == null) {
      return 0;
    }
    else {
      return startupBalance;
    }
  }

  Future<void> resetBalance() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('startupBalance', 0);
  }

  Future<double> addToBalance(amount) async {
    final prefs = await SharedPreferences.getInstance();
    double previousBalance = await getBalance();
    double currentBalance = previousBalance + amount;
    await prefs.setDouble('startupBalance', currentBalance);
    return currentBalance;
  }

}
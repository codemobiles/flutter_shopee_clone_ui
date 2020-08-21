import 'package:intl/intl.dart';

class Format{

  static final Format _instance = Format._internal();

  Format._internal();

  factory Format() => _instance;

  String currency(double money, {decimal = true}) {
    if(decimal){
      return NumberFormat("#,##0.00").format(money);
    }
    return NumberFormat("#,##0").format(money);
  }
}
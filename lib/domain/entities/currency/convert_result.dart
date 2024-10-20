import 'package:decimal/decimal.dart';

class ConvertResult {
  ConvertResult(this.withoutCommission, this.withCommission, this.commission);

  Decimal withoutCommission;
  Decimal withCommission;
  double commission;
}

import 'package:intl/intl.dart';

import '../constant.dart';

extension DateTimeExtension on DateTime {
  String get toLocalDateFormat =>
      DateFormat(Constant.dateLocalFormat).format(this);
}
import 'package:intl/intl.dart';

class UtilFormatter {
  static String formatNumber(double number) {
    final tool = NumberFormat("#,##0", "en_US");
    return tool.format(number).replaceAll(",", ".");
  }

  static String formatTimeStamp(DateTime timestamp) {
    // Create the DateFormat formatter
    DateFormat formatter = DateFormat.yMMMMd().add_jm();
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp.second * 1000);
    return formatter.format(date);
  }

  static String getDisplayName(String email) {
    String prefix = email.split('@')[0];
    return prefix[0].toUpperCase() + prefix.substring(1).toLowerCase();
  }
}

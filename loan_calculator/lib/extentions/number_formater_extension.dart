import 'package:intl/intl.dart';

extension IntPriceFormater on int {
  String get intPrice {
    return NumberFormat('#,##,##,##,###').format(this);
  }
}

extension DoublePriceFormater on double {
  String get doublePrice {
    return NumberFormat('#,##,##,##,###.##').format(this);
  }
}

extension NumPriceFormater on num {
  String get numPrice {
    return NumberFormat('#,##,##,##,###.##').format(this);
  }
}

String pointsFormatter(inputPoint) {
  return NumberFormat("#,###,###,###.##").format(inputPoint).toString();
}

String bounzPointsFormatter(inputPoint) {
  return NumberFormat("#,###,###,###").format(inputPoint).toString();
}

extension DateTimeFormater on DateTime {
  String get dmyFormat {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String get dateTimeWithTZFormat {
    return DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(this);
  }

  String get ymddateFormat {
    return DateFormat('E, dd MMM yyyy').format(this);
  }

  String get monthName {
    return DateFormat('MMMM yyyy').format(this);
  }

  String get ymddateFormatWithoutDay {
    return DateFormat('dd MMM yyyy').format(this);
  }
}

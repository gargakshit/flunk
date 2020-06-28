import '../models/monthly_aggregations.dart';

String monthToString(Month month) {
  switch (month) {
    case Month.January:
      return "January";
      break;
    case Month.Febuary:
      return "Febuary";
      break;
    case Month.March:
      return "March";
      break;
    case Month.April:
      return "April";
      break;
    case Month.May:
      return "May";
      break;
    case Month.June:
      return "June";
      break;
    case Month.July:
      return "July";
      break;
    case Month.August:
      return "August";
      break;
    case Month.September:
      return "September";
      break;
    case Month.October:
      return "Octover";
      break;
    case Month.November:
      return "November";
      break;
    case Month.December:
      return "December";
      break;
    default:
      return "";
      break;
  }
}

int monthToInt(Month month) {
  switch (month) {
    case Month.January:
      return 1;
      break;
    case Month.Febuary:
      return 2;
      break;
    case Month.March:
      return 3;
      break;
    case Month.April:
      return 4;
      break;
    case Month.May:
      return 5;
      break;
    case Month.June:
      return 6;
      break;
    case Month.July:
      return 7;
      break;
    case Month.August:
      return 8;
      break;
    case Month.September:
      return 9;
      break;
    case Month.October:
      return 10;
      break;
    case Month.November:
      return 11;
      break;
    case Month.December:
      return 12;
      break;
    default:
      return 0;
      break;
  }
}

Month intToMonth(int i) {
  switch (i) {
    case 1:
      return Month.January;
      break;
    case 2:
      return Month.Febuary;
      break;
    case 3:
      return Month.March;
      break;
    case 4:
      return Month.April;
      break;
    case 5:
      return Month.May;
      break;
    case 6:
      return Month.June;
      break;
    case 7:
      return Month.July;
      break;
    case 8:
      return Month.August;
      break;
    case 9:
      return Month.September;
      break;
    case 10:
      return Month.October;
      break;
    case 11:
      return Month.November;
      break;
    case 12:
      return Month.December;
      break;
    default:
      return Month.January;
      break;
  }
}

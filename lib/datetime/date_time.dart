//to return todays date formatted as yymmdd

String todaysDateFormatted() {
  // to day
  var dateTimeObject = DateTime.now();

  // year in the format yyyy
  String year = dateTimeObject.year.toString();

  // moth in the format mm

  String month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  //day in the format dd

  String day = dateTimeObject.day.toString();
  if (day.length == 1) {
    day = "0$day";
  }

  //final format dd
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}

//convert string yyymmdd to dateTime object

DateTime createDateTimeObject(String yyyymmdd) {
  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));

  DateTime dateTimeObject = DateTime(yyyy, mm, dd);
  return dateTimeObject;
}

//converting DateTime object to string yyyymmdd

String convertDateTimeToString(DateTime dateTime) {
  //year in the format yyyy
  String year = dateTime.year.toString();

  //month in the formatt mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  //day in the format
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  //final format
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}

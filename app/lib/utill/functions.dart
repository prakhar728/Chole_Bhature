int getoday(){
  DateTime now = DateTime.now();
  int year,month,date;
  year = now.year;
  year = year%2000;
  year *= 10000;
  month = now.month;
  month *= 100;
  date = now.day;

  return year+month+date;
}
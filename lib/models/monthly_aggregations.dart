enum Month {
  January,
  Febuary,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December,
}

class MonthlyAggregation {
  final Month month;
  final int year;
  final int commits;

  MonthlyAggregation({
    this.month,
    this.year,
    this.commits,
  });
}

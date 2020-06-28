import '../../models/git_data.dart';
import '../../models/language_data.dart';
import '../../models/monthly_aggregations.dart';

abstract class DataService {
  Future<GQLData> getAllData();
  Future<List<MonthlyAggregation>> commitHistory(GQLData data);
  Future<Map<String, Language>> languageData(GQLData data);
  int totalRepos(GQLData data);
  int totalCommits(GQLData data);
}

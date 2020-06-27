import '../../models/git_data.dart';
import '../../models/monthly_aggregations.dart';

abstract class DataService {
  Future<GQLData> getAllData();
  // TODO: create monthly aggregation data pipeline
  // TODO: create language aggregation data pipeline
}

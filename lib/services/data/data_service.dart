import '../../models/git_data.dart';

abstract class DataService {
  Future<GQLData> getAllData();
}

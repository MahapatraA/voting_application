import 'dart:convert';
import '../core/api_service.dart';
import '../models/candidate_model.dart';

class VoteService {
  final ApiService _api = ApiService();

  Future<List<Candidate>> getCandidates() async {
    final res = await _api.get('/candidates', auth: true);

    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Candidate.fromJson(e)).toList();
    }
    return [];
  }

  Future<bool> vote(String candidateId) async {
    final res = await _api.post(
      '/candidates/vote/$candidateId',
      {},
      auth: true,
    );

    return res.statusCode == 200;
  }
}
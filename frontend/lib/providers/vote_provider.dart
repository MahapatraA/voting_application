import 'package:flutter/material.dart';
import '../models/candidate_model.dart';
import '../services/vote_service.dart';

class VoteProvider extends ChangeNotifier {
  final VoteService _service = VoteService();

  List<Candidate> candidates = [];
  bool isLoading = false;

  Future<void> fetchCandidates() async {
    isLoading = true;
    notifyListeners();

    candidates = await _service.getCandidates();

    isLoading = false;
    notifyListeners();
  }

  Future<bool> vote(String id) async {
    return await _service.vote(id);
  }
}
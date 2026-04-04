class Candidate {
  final String id;
  final String name;
  final String party;
  final int votes;

  Candidate({
    required this.id,
    required this.name,
    required this.party,
    required this.votes,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      id: json['_id'],
      name: json['name'],
      party: json['party'],
      votes: json['votes'],
    );
  }
}

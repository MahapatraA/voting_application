import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/vote_provider.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({super.key});

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>Provider.of<VoteProvider>(context, listen: false)
            .fetchCandidates());
  }
  @override
  Widget build(BuildContext context) {
    final voteProvider = Provider.of<VoteProvider>(context);


    return Scaffold(
      appBar: AppBar(title: const Text("Vote")),
      body: voteProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: voteProvider.candidates.length,
        itemBuilder: (_, i) {
          final c = voteProvider.candidates[i];

          return ListTile(
            title: Text(c.name),
            subtitle: Text(c.party),
            trailing: ElevatedButton(
              onPressed: () async {
                final success = await voteProvider.vote(c.id);

                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Vote submitted")),
                  );
                }
              },
              child: const Text("Vote"),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:github/github.dart';

class RepoListPage extends StatefulWidget {
  final String githubUsername;

  const RepoListPage({Key? key, required this.githubUsername}) : super(key: key);

  @override
  _RepoListPageState createState() => _RepoListPageState();
}

class _RepoListPageState extends State<RepoListPage> {
  List<Repository> repositories = [];

  @override
  void initState() {
    super.initState();
    _fetchRepositories();
  }

  Future<void> _fetchRepositories() async {
    final github = GitHub(auth: Authentication.withToken('YOUR_GITHUB_ACCESS_TOKEN'));
    final userRepos = await github.repositories.listUserRepositories(widget.githubUsername).toList();
    setState(() {
      repositories = userRepos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.githubUsername}\'s Repositories'),
      ),
      body: ListView.builder(
        itemCount: repositories.length,
        itemBuilder: (context, index) {
          final repo = repositories[index];
          return ListTile(
            title: Text(repo.name),
            onTap: () {
              // Handle repository selection (e.g., navigate to code files)
              print('Selected repository: ${repo.name}');
            },
          );
        },
      ),
    );
  }
}
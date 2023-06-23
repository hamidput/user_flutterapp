import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/blocs/team_member_bloc.dart';
import 'package:flutter_application_1/pages/user_page.dart';
import 'package:flutter_application_1/repositories/team_member_repository.dart';

void main() {
  final teamMemberRepository = TeamMemberRepository();

  runApp(MyApp(teamMemberRepository: teamMemberRepository));
}

class MyApp extends StatelessWidget {
  final TeamMemberRepository teamMemberRepository;

  const MyApp({required this.teamMemberRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Competition Applicant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<TeamMemberBloc>(
        create: (context) => TeamMemberBloc(repository: teamMemberRepository),
        child: UserPage(),
      ),
    );
  }
}

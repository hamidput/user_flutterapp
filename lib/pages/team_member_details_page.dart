import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/team_member.dart';
import 'package:flutter_application_1/widgets/add_team_member_form.dart';

class TeamMemberDetailsPage extends StatelessWidget {
  final TeamMember? teamMember;

  const TeamMemberDetailsPage({this.teamMember});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Member Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddTeamMemberForm(teamMember: teamMember),
        ),
      ),
    );
  }
}

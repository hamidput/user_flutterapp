import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/team_member_details_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/blocs/team_member_bloc.dart';
import 'package:flutter_application_1/models/team_member.dart';
import 'package:flutter_application_1/widgets/team_member_card.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: BlocBuilder<TeamMemberBloc, TeamMemberState>(
        builder: (context, state) {
          if (state is TeamMemberLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TeamMemberLoaded) {
            final teamMembers = state.teamMembers;
            return ListView.builder(
              itemCount: teamMembers.length,
              itemBuilder: (context, index) {
                final teamMember = teamMembers[index];
                return TeamMemberCard(
                  teamMember: teamMember,
                  onUpdate: (updatedTeamMember) {
                    BlocProvider.of<TeamMemberBloc>(context).add(
                      UpdateTeamMember(updatedTeamMember),
                    );
                  },
                );
              },
            );
          } else if (state is TeamMemberError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeamMemberDetailsPage(),
            ),
          );
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}

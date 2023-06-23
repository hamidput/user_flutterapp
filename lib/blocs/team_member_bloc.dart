import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/team_member.dart';
import 'package:flutter_application_1/repositories/team_member_repository.dart';

part 'team_member_event.dart';
part 'team_member_state.dart';

class TeamMemberBloc extends Bloc<TeamMemberEvent, TeamMemberState> {
  final TeamMemberRepository repository;

  TeamMemberBloc({required this.repository}) : super(TeamMemberInitial());

  @override
  Stream<TeamMemberState> mapEventToState(TeamMemberEvent event) async* {
    if (event is FetchTeamMembers) {
      yield TeamMemberLoading();
      try {
        final teamMembers = await repository.getTeamMembers();
        yield TeamMemberLoaded(teamMembers);
      } catch (e) {
        yield const TeamMemberError('Failed to load team members');
      }
    } else if (event is UpdateTeamMember) {
      yield TeamMemberLoading();
      try {
        final updatedTeamMember =
            await repository.updateTeamMember(event.teamMember);
        yield TeamMemberUpdated(updatedTeamMember);
      } catch (e) {
        yield const TeamMemberError('Failed to update team member');
      }
    } else if (event is AddTeamMember) {
      yield TeamMemberLoading();
      try {
        final addedTeamMember = await repository.addTeamMember(event.teamMember);
        yield TeamMemberAdded(addedTeamMember);
      } catch (e) {
        yield const TeamMemberError('Failed to add team member');
      }
    }
  }
}

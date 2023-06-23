part of 'team_member_bloc.dart';

abstract class TeamMemberEvent extends Equatable {
  const TeamMemberEvent();

  @override
  List<Object> get props => [];
}

class FetchTeamMembers extends TeamMemberEvent {}

class UpdateTeamMember extends TeamMemberEvent {
  final TeamMember teamMember;

  const UpdateTeamMember(this.teamMember);

  @override
  List<Object> get props => [teamMember];
}

class AddTeamMember extends TeamMemberEvent {
  final TeamMember teamMember;

  const AddTeamMember(this.teamMember);

  @override
  List<Object> get props => [teamMember];
}

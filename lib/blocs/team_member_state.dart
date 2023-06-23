part of 'team_member_bloc.dart';

abstract class TeamMemberState extends Equatable {
  const TeamMemberState();

  @override
  List<Object> get props => [];
}

class TeamMemberInitial extends TeamMemberState {}

class TeamMemberLoading extends TeamMemberState {}

class TeamMemberLoaded extends TeamMemberState {
  final List<TeamMember> teamMembers;

  const TeamMemberLoaded(this.teamMembers);

  @override
  List<Object> get props => [teamMembers];
}

class TeamMemberUpdated extends TeamMemberState {
  final TeamMember teamMember;

  const TeamMemberUpdated(this.teamMember);

  @override
  List<Object> get props => [teamMember];
}

class TeamMemberAdded extends TeamMemberState {
  final TeamMember teamMember;

  const TeamMemberAdded(this.teamMember);

  @override
  List<Object> get props => [teamMember];
}

class TeamMemberError extends TeamMemberState {
  final String message;

  const TeamMemberError(this.message);

  @override
  List<Object> get props => [message];
}

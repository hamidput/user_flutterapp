import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/team_member.dart';

class TeamMemberRepository {
  static const String apiUrl = 'https://localhost:3000'; // Replace with your API URL

  Future<List<TeamMember>> getTeamMembers() async {
    final response = await http.get(Uri.parse('$apiUrl/get_teamember'));
    if (response.statusCode == 200) {
      final List<TeamMember> data = json.decode(response.body);
      return data;
   //   return  data.map((json) => TeamMember.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load team members');
    }
  }

  Future<TeamMember> updateTeamMember(TeamMember teamMember) async {
    final response = await http.put(
      Uri.parse('$apiUrl/${teamMember.id}'),
      body: teamMember.toJson(),
    );
    if (response.statusCode == 200) {
      return TeamMember.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update team member');
    }
  }

  Future<TeamMember> addTeamMember(TeamMember teamMember) async {
    final response = await http.post(
      Uri.parse('$apiUrl/add_members'),
      body: teamMember.toJson(),
    );
    if (response.statusCode == 201) {
      return TeamMember.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add team member');
    }
  }
}

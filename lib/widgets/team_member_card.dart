import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/team_member.dart';
import 'package:flutter_application_1/widgets/accordion_section.dart';
import '../pages/team_member_details_page.dart';

class TeamMemberCard extends StatefulWidget {
  final TeamMember teamMember;
  final Function(TeamMember) onUpdate;

  const TeamMemberCard({
    required this.teamMember,
    required this.onUpdate,
  });

  @override
  _TeamMemberCardState createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<TeamMemberCard> {
  final _formKey = GlobalKey<FormState>();
  late String updatedName;
  late String updatedEmail;

  @override
  void initState() {
    super.initState();
    updatedName = widget.teamMember.name;
    updatedEmail = widget.teamMember.email;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.teamMember.name),
        subtitle: Text(widget.teamMember.email),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeamMemberDetailsPage(
                teamMember: widget.teamMember,
              ),
            ),
          );
        },
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title:const  Text('Update Team Member'),
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          initialValue: widget.teamMember.name,
                          decoration: const InputDecoration(labelText: 'Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            updatedName = value!;
                          },
                        ),
                        TextFormField(
                          initialValue: widget.teamMember.email,
                          decoration:const InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            updatedEmail = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child:const  Text('Update'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final updatedTeamMember = TeamMember(
                            id: widget.teamMember.id,
                            name: updatedName,
                            email: updatedEmail,
                          );
                          widget.onUpdate(updatedTeamMember);
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

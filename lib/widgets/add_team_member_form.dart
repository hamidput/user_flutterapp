import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/team_member.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/team_member_bloc.dart';

class AddTeamMemberForm extends StatefulWidget {
  final TeamMember? teamMember;

  const AddTeamMemberForm({this.teamMember});

  @override
  _AddTeamMemberFormState createState() => _AddTeamMemberFormState();
}

class _AddTeamMemberFormState extends State<AddTeamMemberForm> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  // Add more fields as needed

  @override
  void initState() {
    super.initState();
    if (widget.teamMember != null) {
      name = widget.teamMember!.name;
      email = widget.teamMember!.email;
      // Initialize other fields if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: name,
            decoration:const  InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
              name = value!;
            },
          ),
          TextFormField(
            initialValue: email,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
            onSaved: (value) {
              email = value!;
            },
          ),
          // Add more form fields or sections as needed
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final teamMember = TeamMember(
                  id: widget.teamMember!.id,
                  name: name,
                  email: email,
                );
                // Call the appropriate method based on whether it's an update or add
                if (widget.teamMember != null) {
                  // Update team member
                  BlocProvider.of<TeamMemberBloc>(context).add(
                    UpdateTeamMember(teamMember),
                  );
                } else {
                  // Add team member
                  BlocProvider.of<TeamMemberBloc>(context).add(
                    AddTeamMember(teamMember),
                  );
                }
                Navigator.pop(context);
              }
            },
            child: Text(widget.teamMember != null ? 'Update' : 'Add'),
          ),
        ],
      ),
    );
  }
}

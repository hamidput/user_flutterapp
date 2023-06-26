class TeamMember {
  final int id;
  final String name;
  final String email;

  TeamMember({required this.id, required this.name, required this.email});

  static fromJson(json) {}

  Map toJson()
  =>{
        'name': name,
        'id': id,
        'email': email
      };
  

  

}

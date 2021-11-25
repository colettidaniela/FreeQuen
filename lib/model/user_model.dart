class  UserModel{
  String? uid;
  String? nombre;
  String? email;
  String? tipolocal;
  String? ubicacionlocal;


  UserModel({this.uid, this.nombre, this.email, this.tipolocal, this.ubicacionlocal});

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      nombre: map['nombre'],
      email: map['email'],
      tipolocal: map['tipolocal'],
      ubicacionlocal: map['ubicacionlocal'],
    );
  }


  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'nombre': nombre,
      'email': email,
      'tipolocal': tipolocal,
      'ubicacionlocal': ubicacionlocal,
    };
  }
}
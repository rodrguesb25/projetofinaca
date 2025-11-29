import '../models/profile_model.dart';

class ProfileController {
  final ProfileModel user = ProfileModel(
    nome: "Bruno Rodrigues",
    email: "rodrigues@email.com",
    idade: 28,
    cpf: "123.456.789-00",
    cep: "12345-678",
    endereco: "Rua das Flores",
    numero: "120",
    celular: "(11) 99999-0000",
  );
}

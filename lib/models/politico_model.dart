
class Politico {
  String itemImage;
  String itemName;
  String patrimonio;
  String partido;
  String cargo;
  int imageNumber;

  Politico(this.itemImage, this.itemName, this.patrimonio, this.partido, this.cargo, this.imageNumber);
}

final politicosLista = <Politico> [
  new Politico("gonzalo.jpg", "Gonzalo", "500,000,000", "PLD", "Candidato-MOPC", 1),
  new Politico("gonzalo.jpg", "Gonzalo", "500,000,000", "PLD", "Candidato-MOPC", 2),
  new Politico("gonzalo.jpg", "Gonzalo", "500,000,000", "PLD", "Candidato-MOPC", 3),
  new Politico("gonzalo.jpg", "Gonzalo", "500,000,000", "PLD", "Candidato-MOPC", 4),
  new Politico("gonzalo.jpg", "Gonzalo", "500,000,000", "PLD", "Candidato-MOPC", 5),
];

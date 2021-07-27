class Fixture{
  String name = "";
  double amount = 0;
  double prop = 1.0;
  double gpm = 0;

  Fixture(this.name, this.amount, this.prop, this.gpm);

  Fixture.newBlank(){}

  Fixture.copy(Fixture fixture){
    name = fixture.name;
    amount = fixture.amount;
    prop = fixture.prop;
    gpm = fixture.gpm;
  }
}
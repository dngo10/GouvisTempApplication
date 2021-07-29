import 'dart:math';

class Fixture{
  String name = "";
  double amount = 0;
  double prop = 1.0;
  double gpm = 0;

  double factorx = 1;
  double exponential = 0;
  double outNumProp = 0;

  Fixture(this.name, this.amount, this.prop, this.gpm, this.exponential, this.factorx, this.outNumProp);

  Fixture.newBlank(){}

  Fixture.copy(Fixture fixture){
    name = fixture.name;
    amount = fixture.amount;
    prop = fixture.prop;
    gpm = fixture.gpm;
  }

  double getProbability(int numOfApartment){
    if(amount == 1){
      return prop;
    }else if(amount > 1 && amount < 20){
      return factorx*prop*pow(numOfApartment, exponential);
    }else if(amount > 20){
      return outNumProp;
    }
    return -9999;
  }
}


//Life cycle hook sequence:

/**
 * ngOnChange()
 * ngOnInit()  is a good place for a component to fetch its initial data.
 * Constructors should do no more than set the initial local variables to simple values.
 * directive's data-bound input properties are not set until after construction.
 * If you need to initialize the directive based on those properties, set them when ngOnInit() runs.
 * ngDoCheck() 
 * ngAfterContentInit()
 * ngAfterContentChecked()
 * ngAfterViewInit()
 * ngAfterViewChecked()
 * ngOnDestroy()
 * 
 * 
 */
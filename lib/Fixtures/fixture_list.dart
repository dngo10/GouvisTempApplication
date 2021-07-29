
import 'package:flutter_application_1/Fixtures/fixture_unit.dart';

class FixtureList{
  int numberOfApartment = 0;

  final List<Fixture> _fixtureList = [
    Fixture("Bathtub (no Shower)",                  0, 0.01,   5.5, -0.25, 1.2, 0.006),
    Fixture("Bidet",                                0, 0.01,   2.0, -0.07, 0.75, 0.006),
    Fixture("Combination Bath/Shower",              0, 0.055, 5.5, -0.28, 0.92, 0.022),
    Fixture("Faucet, Lavatory",                     0, 0.02,   1.5, -0.15, 1.1, 0.014),
    Fixture("Shower, per head (no Bathtub)",        0, 0.045, 2.0, -0.3, 0.82, 0.015),
    Fixture("Water Closet, 1.28 GPF Gravity Tank",  0, 0.01, 3.0, -0.07, 0.75, 0.006), //TEST
    Fixture("Dishwasher",                           0, 0.005, 1.3, -0.1, 1, 0.004),
    Fixture("Faucet, Kitchen Sink",                 0, 0.02, 2.2, -0.15, 1.1, 0.014),
    Fixture("Clothes Washer",                       0, 0.055, 3.5, -0.3, 0.95, 0.021),
    Fixture("Faucet, Laundry",                      0, 0.02, 2.0, -0.15, 1.1, 0.014),
    Fixture("Faucet, Bar Sink",                     0, 0.02, 1.5, -0.15, 1.1, 0.014),
  ];

  List<Fixture> getItems(){
    return _fixtureList;
  }

  void removeItem(int index){
    if(index > 11){
      _fixtureList.removeAt(index);
    }
  }

  void addItem(Fixture item){
    _fixtureList.add(item);
  }



}

/**
 * Angular
 * 
 * @Input() decorator
 * 
 * //CHILD
 * export class A{
 *    @Input() hero! : Hero;
 *    @Input('abc') masterName = '';
 * }
 * 
 * 
 * //PARENT
 * 
 * <app-hero-child *ngFor="let hero of heroes"
 *    [hero] = "hero"
 *    [abc] = "master"
 * >
 * </app-hero-child>
 * 
 * **Intercept input property changes with a setter
 * 
 * export class NameChildComponent{
 *    private _name;
 * 
 *    @Input()
 *    get name(): string {return this._name;}
 * 
 *    set name(name: string){
 *      this._name = (name && name.trim()) || '<no name set>';
 *    }
 * }
 * 
 * **Parent listens for child event
 * 
 * export class VoterComponent{
 *    @Input() name = '';
 *    @Output() voted = new EventEmitter<boolean>();
 *    didVote = false;
 * 
 *    vote(agreed: boolean){
 *      this.voted.emit(agreed);
 *      this.didVote = true;
 *    }
 * }
 * 
 * **Parent intereacts with child using local variable
 * 
 *   In this case you use the #variable to get the property out.
 *   You interact with child component through TEMPLATE LVL ONLY.
 * 
 * 
 * **Parent calls an @ViewChild
 * 
 * You can use view child to access to A CHILD.
 * 
 * @export class A implement ngAfterViewInit{
 *    @ViewChild(ChildComponent)
 *    private childComponent: ChildComponent;
 * }
 * 
 * // The ngAfterViewInit() is important. The timer isn't available until after
 * Angular displays the parent view.
 * 
 * ** Parent and Children communicate using a service
 * 
 * component-style:
 * 
 * :host
 * 
 * pseudo-class selector to target styles in the element that hosts the component.
 * 
 * You can't reach the host element from inside the component with other slectors
 * 
 * Conditional content projection:
 * 
 * If your component needs to conditionally render content
 * 
 * ngTemplateOutlet
 * 
 * 
 * 
 */
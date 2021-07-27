
import 'package:flutter_application_1/Fixtures/fixture_unit.dart';

class FixtureList{
  final List<Fixture> _fixtureList = [
    Fixture("Bathtub (no Shower)",                  0, 1,   5.5),
    Fixture("Bidet",                                0, 1,   2.0),
    Fixture("Combination Bath/Shower",              0, 5.5, 5.5),
    Fixture("Faucet, Lavatory",                     0, 2,   1.5),
    Fixture("Shower, per head (no Bathtub)",        0, 4.5, 2.0),
    Fixture("Water Closet, 1.28 GPF Gravity Tank",  0, 1.0, 3.0),
    Fixture("Dishwasher",                           0, 0.5, 1.3),
    Fixture("Faucet, Kitchen Sink",                 0, 2.0, 2.2),
    Fixture("Clothes Washer",                       0, 5.5, 3.5),
    Fixture("Faucet, Laundry",                      0, 2,   2.0),
    Fixture("Faucet, Bar Sink",                     0, 2.0, 1.5),
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
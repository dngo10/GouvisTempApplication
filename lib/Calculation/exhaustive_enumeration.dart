class ExhaustiveEnumberation{
  
}

/**
 * 
 * asynchronous and event-based programs by using observable sequences.
 * 1 core type: Observable.
 * satellite types: Observer, Schedulers, Subjects.
 * operators: map, filter, reduce, every.
 * 
 * Observable: represents the idea of an invokable collection of future values or events.
 * Observer: is a collection of callbacks that knows how to listen to values delivered by the Observable.
 * Subscription: represents the execution of an Observable, is primarily useful for cancelling the execution.
 * Operators: are pure functions that enable a funtional programming style of dealing with collections wit operations like map, filter, concat, reduce.
 * Subjects: is equivalent to an Event Emitter, and the only way of multicasting a value or event to multiple Observers.
 * Schedulers: are centralized dispatchers to control concurrency, allowing us to coordinate when computation happens one setTimeout or requestAnimationFrame or others.
 * 
 * Purity:
 * 
 * Ability to produce values using pure functions.
 * 
 * Flow:
 * 
 * Control how the events flow through your observables.
 * 
 * Observable:
 * 
 * passing messages between parts of your application.
 * -- technique for event handling, asynchronous programming, and handling mutliple values.
 * -- 
 * observer pattern is a software design pattern in which an object, called a subject, maintains
 * a list of its dependents, called observers, and notifies them automatically of state changes.
 * 
 * observables are declarative -- a function for publishing values, but it is not executed
 * until a consumer subscribes to it. The subscribed consumer then receives notifications until
 * the function completes or until they unsubscribe.
 * 
 * An observable can deliver multiple values of any type -- literals, messages, or events, depending
 * on the context.
 * 
 * Because setup and teardown logic are both handled by the observable, your application code only needs
 * to worry about subscribing to consume values, and when done, unsubscribing.
 * 
 * //----------------------
 * 
 * Publisher.
 *  create an Observable instance -> defines a subscriber function.
 *  function is executed when a consumer calls the subscribe() method.
 *  Subscriber function defines how to obtain or generate values or messages to be published.
 * 
 *  Observerable:
 *  
 *  Are lazy Push collections of multiple values.
 *  Pull and Push are two different protocols that describe how a data Producer can communicate with a data Consumer.
 * 
 *  Pull: Conversumer determines when it receives data from the data Producer.
 *        Producer itself is unaware of when the data will be delivered to the consumer.
 * 
 *  Push: The Producer determines when to send data to the Consumer. The Consumer is unaware of when it will receive that data.
 *        Promises are the most common type of Push system in Javascript today.
 * 
 * Observer:
 * 
 * Is a consumer of values delivered by an Observable.
 * Observers are simply a set of callbacks, one for each type of notification delivered by the Observable: next, error, and complete.
 * 
 * Operator:
 * 
 * Operators are functions. 2 kind:
 * 
 * Pipable Operators:
 *  are the kind that can be piped to Observables using the syntax observableInstance.pipe(operator())
 *  When called, they do not change the exsting Observable instance. Instead they return a new Observable, whose subscription logic is based
 * on the first Observable.
 * 
 *  A Pipeable Operator: takes an Observable as input and returns another Obserable.
 *  Subscribing to the output Observable will also subscribe to the input Observable.
 * 
 * Pipeable operators are functions, so they could be used like ordinary functions.
 * 
 * Creation Operators:
 *  are functions that can be used to create an Observable with some common predefiend behavior or by joining other Observables.
 * 
 * Higher-order Observables:
 *  Handle Observales of Observables -- meaning higher-order Observables.  
 * 
 * const fileObservable = urlObservable.pipe(
 *    map((url) => http.get(url)),
 *    concatAll()
 *   );
 *
 * concatAll(),
 * mergeAll(),
 * switchAll(),
 * exhaustAll(),
 * 
 * Marble diagrams: There is ALL operations to WALK THROUGH... 
 * 
 * Subscriptions:
 * 
 *  Is an object that represents a disposable resource.
 * 
 * Subject:
 * 
 *  RxJS Subject is a special type of Observable that allows values to be multicasted to many Observers.
 *  While plain Observables are unicast (each subscribed Observer owns an independent execution of the Observable),
 * Subjects are multicast.
 * 
 *  A Subject is like an Observable, but can multicast to many Observers.
 *  Subjects are like EventEmitters: they main a registry of many listeners.
 * 
 * Every Subject is an Observer. It is an object with the methods next(v), error(e), and complete(). To feed
 * a new value to the Subject, just call next(theValue), and it will be multicasted to the Observers registered
 * to listen to the Subject.
 * 
 * 
 * 
 * Defining Observers:
 *  next      : requried. A handler for each delivered value. Called zero or more times after execution starts.
 *  error     : Optional. A handler for an error notification. An error halts execution of the observable instance.
 *  complete  : Optional. A handler for the execution-complete notifiation.
 * 
 * Subscribing:
 *  An Observerable instance begins publishing values only when someone subscribes to it.
 *  of(...items) -- Returns an Observable instance that synchronously delivers the values provided as arguments.
 *  from(iterable) -- Converts its argument to an Observable instance. This method is commonly used to convert
 *  an array to an observable.
 *  
 * Creating observables:
 * 
 * Use the Observable consstructor to create an observable stream of any type.
 * The constructor taks as its argument the subscriber function to run when the observable's subscribe() method executes.  
 * 
 * 
 * 
 * 
 */
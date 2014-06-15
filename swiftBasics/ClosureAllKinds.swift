//
//  ClosureAllKinds.swift
//  swiftBasics
//
//  Created by mar Jinn on 6/11/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//


/*

CODE SNIPPET - SWIFT CLASS
--------------------------
import Foundation

class <#CLASSNAME#>
{
    init()
    {
        return;
    }
    
    deinit
    {
        println("\(self) is being deinitialized");
    }
    
}

typealias <#ALIAS_NAME#> = <#CLASSNAME#>;

extension <#ALIAS_NAME#>
{
    
}
*/

import Foundation


class ClosureAllKinds
{
    init()
    {
        self.sortThisMess();
        
        let increment_by_ten:(Void) ->Int = makeIncrementor(forIncrement: 10);
        
        println(increment_by_ten())   //10
        
        println(increment_by_ten())   //20
        
        println(increment_by_ten())   //30
        
        return;
    }
}

typealias ClosureDemo_Sort = ClosureAllKinds;

extension ClosureDemo_Sort
{
    func sortThisMess(Void) -> Void
    {
        //Array to Sort
        let names:String[] = ["Chris","Alex","Ewa","Barry","Daniela"];
        
        /**********************************************/
        //Closure To sort -  func supplied as a CLOSURE
        /**********************************************/
        
        //names.sort(<#isOrderedBefore: (String, String) -> Bool#>)
        //Function type - > (String, String) -> Bool
        
        func backWards(s1:String,s2:String)-> Bool
        {
            return s1 > s2;
        }
        
        var reversed:String[];
        reversed = sort(names,backWards);
        
        println("originalArray: \(names)");
        println("reversedArray: \(reversed)");
        
        /******************************************************/
        //Closure To sort -  inline CLOSURE Closure Expressions
        /*****************************************************/
        
        //Closure Expressions - general Syntax
        /*
            { (parameters) -> return type in
                statements
            }
        */
        var reversed_inline:String[];
        reversed_inline =
            sort(names,
                //The inline closure
                { (s1:String,s2:String) -> Bool in
                    return s1 > s2;
                } );
        
        println("reversed_inline: \(reversed_inline)");
        
        /******************************************************/
        //Closure To sort -  inline CLOSURE Closure Expressions 
        // REDUCED SINGLE LINE
        /*****************************************************/
        var reversed_reduced_single_line:String[]
        reversed_reduced_single_line =
            //Closure - Expressed in a single line
            sort(names,{ (s1:String,s2:String) -> Bool in return s1 > s2 });
        
        println(
            "reversed_reduced_single_line: \(reversed_reduced_single_line)");
        
        /******************************************************/
        //Closure To sort -  inline CLOSURE Closure Expressions
        // REDUCED SINGLE LINE - TYPES INFERRED FROM CONTEXT
        /*****************************************************/
        var reversed_type_inferred:String[];
        reversed_type_inferred =
            //Closure - all types omitted - types will be inferred form context
        sort(names,{ s1,s2 in return s1 > s2 });
        
        println(
            "reversed_type_inferred: \(reversed_type_inferred)");
        
        /******************************************************/
        //Closure To sort -  inline CLOSURE Closure Expressions
        // REDUCED SINGLE LINE - TYPES INFERRED FROM CONTEXT -
        // IMPLICIt RETURNs - return statement omitted
        /*****************************************************/
        var reversed_implicit_returns:String[];
        reversed_implicit_returns =
            //return statement omitted
        sort(names, { s1,s2 in s1 > s2 });
        println(
            "reversed_implicit_returns: \(reversed_implicit_returns)");
        
        /******************************************************/
        //Closure To sort -  inline CLOSURE Closure Expressions
        // REDUCED SINGLE LINE - TYPES INFERRED FROM CONTEXT -
        // IMPLICIt RETURNs - return statement omitted -
        //SHORTHAND ARGUMENTS
        /*****************************************************/
        var reversed_shorthand_arguments:String[];
        reversed_shorthand_arguments =
            //Closure made up just with 2 arguments
            //$0 denotes first argument
            //$1 denotes second argument
            
            /* sort(names,{ $0,$1 in $0 > $1 } ); */
            
            // "in" keyword can also be omitted 
            //because the closure expression is made up entirely of its body
            sort(names,{ $0 > $1 } );
        println(
            "reversed_shorthand_arguments: \(reversed_shorthand_arguments)");
        
        /******************************************************/
        //Closure To sort -  inline CLOSURE Closure Expressions
        //TRAILING CLOSURES
        /*****************************************************/
        var reversed_trailing_closure:String[];
        reversed_trailing_closure =
            //trailing closure
            sort(names) { (s1:String,s2:String) -> Bool in
                return s1 > s2;
        }
        println(
            "reversed_trailing_closure: \(reversed_trailing_closure)");
        
        /******************************************************/
        //Closure To sort -  inline CLOSURE Closure Expressions
        //TRAILING CLOSURES
        // REDUCED SINGLE LINE - TYPES INFERRED FROM CONTEXT -
        // IMPLICIt RETURNs - return statement omitted -
        //SHORTHAND ARGUMENTS
        /*****************************************************/
        var reversed_trailing_closure_shorthand:String[];
        reversed_trailing_closure_shorthand =
            //trailing closure
            sort(names) { $0 > $1 };
        
        println(
            "reversed_trailing_closure_shorthand: \(reversed_trailing_closure_shorthand)");
        
        
        
        /******************************************************/
        //Trailing closures -  where it is useful
        // The code creates a dictionary of mappings between the integer digits
        // and English-language versions of their names. 
        // It also defines an array of integers, 
        // ready to be converted into strings.
        /*****************************************************/
        let digitNames:Dictionary<Int,String> =
        [
            0: "Zero",
            1: "One",
            2: "Two",
            3: "Three",
            4: "Four",
            5: "Five",
            6: "Six",
            7: "Seven",
            8: "Eight",
            9: "Nine"
        ];
        
        let numbers:Int[] = [16,58,510];
        
        let strings:String[] =
        numbers.map(
            { (var number:Int) -> String in
                
                var output:String = "";
               
                while(number > 0)
                {
                    output
                        =
                    digitNames[(number % 10)]! + output;
                    
                    number /= 10;
                }
                
                return output;
            });
        
        
        return;
    }
    
    
    
    /******************************************************/
    //FUNCTION TYPE AS RETURN TYPE
    //Capturing values
    /*
     The concept here is that a function which is nested with the 
     main function will be invoked
    */
    /******************************************************/
    func makeIncrementor(forIncrement amount:Int) -> (Void) -> Int
    {
        //This will be captured for the lifetime of the func incrementor
        var runningTotal:Int = 0;
        
        //The closure to be returned
        func incrementor(Void) -> Int
        {
            runningTotal += amount;
            return runningTotal;
        }
        
        //println
        return incrementor;
    }
    
} //Closure Demo Sort - from SWIFT BOOK


/************************************************/
///ClosureDemoFromWWDC
/************************************************/
typealias ClosureDemoFromWWDC_Sort = ClosureAllKinds;

extension ClosureDemoFromWWDC_Sort
{
    func closureBasedSorting(Void) -> Void
    {
        var clients:String[];
        clients = ["Pestov" , "Beunaventura", "Sreeram", "Babbage"];
        
        /************************************************/
        //inline Closure
        /************************************************/
        clients.sort(
            {(a:String,b:String) -> Bool in
                
                return a > b;
                
            }
        );
        
        println(clients);
        
        /************************************************/
        //inline Closure
        /************************************************/
        clients.sort(
            {(a:String,b:String) -> Bool in
                
                return countElements(a) > countElements(b);
                
            }
        );
        
        println(clients);
        
        
        /************************************************/
        //inline Closure - IMPLICIT RETURN - no "return statement"
        /************************************************/
        clients.sort(
            {a,b in countElements(a) > countElements(b)}
        );
        
        /************************************************/
        //inline Closure - IMLICIT RETURN ARGUMENT NAMES
        // $0 $1
        /************************************************/
        clients.sort(
            {countElements($0) > countElements($1)}
        );
        
        return;
    
    }//func closureBasedSorting
    
    func functionalProgrammingDemo(Void) ->Void
    {
        var words:Array<String>
        words = ["angry","hungry","mettoo","poised"];
        
        let wordsFiltered:String[] =
        words.filter(
            
            {(s1:String) -> Bool in
                
                return s1.hasSuffix("gry");
            }
        );
        
        println(words);
        
        //This whole wordy closure syntax can be written
        //more succintly using Implicit return with shorthand argument names
        let wordFilteredElegantly:Array<String> =
        words.filter({ $0.hasSuffix("gry") } );
        //ie start closure with { $0 for fisrt input param
        //return type in inferred
        
        /// Return a Array containing the elements `x` of `self` for which
        /// `includeElement(x)` is `true`
        //func filter(includeElement: (T) -> Bool) -> T[]
//        
//        let wordFilteredElegantlyNew:Array<String> =
//        words.filter({ $0.hasSuffix("gry") } )
//            .map( { $0.uppercaseString } )
//            .reduce("HULK", combine: { "\($0) \($1)" })
        //Output HULK ANGRY HUNGRY
        
        return;
        
    }//functionalProgrammingDemo
    
    
    /************************************************/
    //inline Closure - Closure Variable Capture
    // $0 $1
    /************************************************/
    func capturingStates(Void) ->Void
    {
        
        
        func sum(number:Int[])
        {
            var sum:Int[] = [];
        
        
//        /// Return a Array containing the results of calling
//        /// `transform(x)` on each element `x` of `self`
//        func map<U>(transform: (T) -> U) -> U[]
        
            var numbers:Int[] = [0,1,2,3,4];
            var tmp:Int[] = [];
        
            numbers.map(
            {(p1:Int) -> Int[] in
                
                println(p1);
    
                tmp.append(p1);
                
                return tmp ;
            }
            );
        
        }
            
        return ;
    }
    
    
    //variable that holds a reference to a closure
    var onTemeratureChange:(Int) -> Void
    {
        get
        {
            return self.onTemeratureChange;
        }
    
        set(onTemp)//I don't know how to specify te typeof this variable
        {
            self.onTemeratureChange = onTemp;
        }
    }
    
    func logTemperatureDifferences(initial: Int)
    {
        var prev:Int = initial;
        
        func log(next: Int)
        {
            println("Changed \(next - prev) F");
            
            prev = next;
        }
        
        onTemeratureChange = log;
    }
    
    
}


/************************************************/
//OWNSERSHIP OF CAPTURES
/************************************************/

class TemperatureNotifier
{
    var currentTemp:Int = 72;
    
    var onChange: (Int) -> Void
    {
    get
    {
        return self.onChange;
    
    }//get
    
    set(onTemp)//I don't know how to specify te typeof this variable
    {
        self.onChange = onTemp;
    
    }//set
    
    }//onChange
    
    init()
    {
        self.onChange =
            //to break strong reference cycle
            {[unowned self] (temp:Int) -> Void in
                
                //self captured inside a closure strong reference
                //weak self causes an error here \
                //error: the TemperatureNotifier? does not contain
                //a member named currentTemp
                self.currentTemp = temp;
                
            }
    }
    
}

/************************************************/
//PATTERN MATCHING
/************************************************/
//ENUMS
func enumDemo(Void) -> Void
{

enum TrainStatus
{
    case OnTime;
    case Delayed(Int);
}

    let trainStatus:TrainStatus = TrainStatus.Delayed(random());
 
    //Switch condition evaluates to a constan warning is shown
switch trainStatus
{
    case .OnTime:
        println("on Time");
    
    //minutes is scoped only for this case
    case .Delayed(let minutes):
        println("Delayed by \(minutes) minutes");
    
    default:
        println("Not a safe place for humans")
}
    
   //PATTERN COMPOSE
    //Switch can also be performed based on values of associated cases
    switch trainStatus
    {
        case .OnTime:
            println("on Time");
        
        case .Delayed(let minutes):
            println("Delayed by \(minutes) minutes");
        
        case .Delayed(1):
            println("Nearly On time");
        
        case .Delayed(2...10):
            println("Almost");
        
        // "_" wildcard pattern - matches against any delay
        case .Delayed(_):
            println("It will get here whne it is ready");
        
        default:
            println("Not a safe place for humans")
    }
    
    //ENUM INSIDE ANOTHER ENUMs data
    enum VacationStatus
    {
        case Traveling(TrainStatus);
        case Relaxing(daysLeft:Int);
    }
    
    let vacationStatus:VacationStatus =
    VacationStatus.Traveling(TrainStatus.Delayed(random()));
    
    //Nested associated value switching is also possible
    switch vacationStatus
        {
        
        case .Traveling(.OnTime):
            println("Ontime");
        
        case .Traveling(.Delayed(1..15)):
            println("Delayed");
    
        default:
            println("Not a safe place for humans")
    
        }
    
    
    //TYPE PATTERNS
    //SWITCHING ON TYPES
    class Car
    {
      func checkOil(Void) -> Void
      {
        return;
      }
        
        func pumpTires(Void) -> Void
        {
            return;
        }

    }
    
    class ForMulaOne:Car
    {
        func enterPit(Void)-> Void
        {
            return;
        }
        
    }
    
    class RaceCar:Car
    {
        var hasTurbo:Bool = false;
        
        func tuneTurbo(Void)-> Void
        {
            return;
        }
        
    }
    
    //SWITCHING ON TYPES
    func tuneUp(car:Car) -> Void
    {
        switch car
        {
            //Check if  a var is of type and then cast it to the type
            //TYPE CASTING
            case let formulaOne as ForMulaOne :
                formulaOne.enterPit();
            
            case let raceCar as RaceCar:
                if raceCar.hasTurbo
                {
                    raceCar.tuneTurbo();
                }
            
            default:
                car.checkOil();
                car.pumpTires();
        }
    }

}

//TUPLES
func patternMatchingOnTuples(Void) -> Void
{
    let color = (1.0, 1.0, 1.0,1.0);
    
    //If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple:
    switch color
        {
            case (0.0, 0.5...1.0, let blue, _):
                println("Green and \(blue * 100) % bule");
        
            case let (r,g,b,1.0) where r == g && g == b :
                println("Opaque Grey \(r * 100) % bule");
        
            default:
                println("Opaque Grey  bule");
  
        }
    
}


/*************************************************/
//VALIDATNG A PROPERTY LIST
/*************************************************/
func plistDemo(Void) -> Void
{

    struct State
    {
        var name:NSString;
        var population:NSNumber;
        var abbr:NSString;
    }
    
    func stateFromPlist(list: Dictionary<String, AnyObject>) -> State?
    {
        var structInit:State?;
        
        var name:String? = nil;
        
        switch list["name"]
        {
            //type cast as nsstring
            case .Some(let listName as NSString):
                name = listName;
            
            default:
                name = nil;
        }
    
        switch (list["name"] , list["population"], list["abbr"])
            {
            //type cast as nsstring - case matching with tuple pattern
            case   ( .Some(let listName as NSString),
                    .Some(let pop as NSNumber),
                    .Some(let abbr as NSString))
                where abbr.length == 2:
                  return State(name:listName, population:pop,abbr:abbr)
            
            
            default:
                name = nil;
            }
        
        
        //We can also do this to check if all dictionary value have non-nil values
        if(list["name"] && list["population"] && list["abbr"])
        {
            //type casting is necessary as struct objects are strongly types
            structInit = State(name:list["name"] as NSString, population:list["population"] as NSNumber,abbr:list["abbr"] as NSString);
        }
        
        return structInit;
    }
    
    stateFromPlist(
        ["name" :  "California",
            "population" : 38_040_000,
            "abbr" : "CA"
        ]
    );

    
    return;
}


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


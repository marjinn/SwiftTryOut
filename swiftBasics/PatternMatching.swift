//
//  PatternMatching.swift
//  swiftBasics
//
//  Created by mar Jinn on 6/15/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

import Foundation

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


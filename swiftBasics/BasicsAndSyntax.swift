//
//  BasicsAndSyntax.swift
//  swiftBasics
//
//  Created by mar Jinn on 6/29/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

import Foundation

//PRINT


func VariableJourney(Void)-> Void
{
    /************************/
    //VARIABLES AND CONSTANTS
    /************************/
    let languageName: String    = "SWIFT";
    
    var version: Double         = 1.0;
    
    //immutable
    let introduced: Int         = 2014;
    let isAwesome: Bool         = true;
    
    return;
}

func StringManipulations(Void) ->Void
{
    //STRING -- Same as string
    let SomeString:String = "I appear to be a string";
    
    let pathComponents:String[] = "~/Documents".pathComponents;
    //["~", "Documents"]
    
    //STRING - as also a collection of characters
    //Iterating through a string
    for character:Character in "mouse"
    {
        println(character);
        /*
        m
        o
        u
        s
        e
        */
        
        //Combining Strings and Chracters
        let a: Int = 3;
        let b:Int = 5;
        println("\(a) times \(b) is \(a * b)");
        
        // STRING mutability
        var oneString:String = "This is";
        let twoString: String = " a string";
        oneString += twoString;
        
    }
    
    return ;
}

func ArrayDemo(Void) -> Void
{
    //mutable array
    var names:Array<String> =
    ["Anna","Alex","Brian","Jack"];
    
    
    //ITERATION
    //For in RANGES LOOP
    for number:Int in 1...5 //3 dots includes 5..2 dots exclude 5
    {
        let tmp:String = "\(number) times 4 is \(number * 4)";
        println(tmp);
    }
    
    //half - closed
    for number:Int in 0..5 //3 dots includes 5..2 dots exclude 5
    {
        let tmp:String = "\(number) times 4 is \(number * 4)";
        println(tmp);
    }
    
    //MODIFICATION
    var shoppingList:Array<String>  =
    ["Eggs","Milk"];
    
    //ACCEES
    let tmpOne:String = shoppingList[0];
    println(tmpOne);
    
    //APPEND
    shoppingList += "Floor";
    shoppingList += ["Cheese" ,"Butter" ,"Cholcolate Spread"];
    
    shoppingList[0] = "Six Eggs";
    //range
    shoppingList[3..5] = ["Bananas","Apples"];
    
}

func DictionaryDemoWithOptionals(Void) -> Void
{
    //mutable Dictionary
    var numberOfLegs:Dictionary<String,Int> =
    ["ant": 6,"snake": 0,"cheetah": 4];
    
    //iteration with tuple
    for (animalName:String,legCount:Int) in numberOfLegs
    {
        let tmp:String = "\(animalName)s have \(legCount) legs";
        println(tmp);
    }
    
    //MODIFICATION
    numberOfLegs["snake"] = 18;
    numberOfLegs["snake"] = 19;
    
    //ACCEES - Optionals
    
    let possibleLegcount:Int!/*(implicitly unwrapped)*/ =
    numberOfLegs["aardvark"];
    
    let possible_Leg_count:Int? =
    numberOfLegs["aardvark"];
    
    //UNWRAPPING - !   .without nil check causes assertion
    if (possible_Leg_count == nil)
    {
        println("AArdvac not found");
    }
    else
        
    {
        let legCount:Int = possible_Leg_count!
        println("AArdvac has \(legCount) legs");
    }
    
    //UNWRAPPING - if let
    if let legCount:Int = possible_Leg_count
    {
        println("AArdvac has \(legCount) legs");
    }
    
    
    //SWITCH - dont automatically fall through - should contain default
    if let legCount:Int = possible_Leg_count
    {
        switch (legCount)
        {
            
        case 0:
            println("It slithers");
            break;
            
        case 1:
            println("It hops");
            break;

            case 2,3,5,7,9:
                println("It limps");
                break;

            case 11..22:
                println("It has A lotS  of legs");
                break;
            
        default:
            println("It walks");
            break;
            
        }
    }
}

//FUNCTION WITH DEFAULT VALUE
func sayHello(name:String = "World")
{
    println("Hello \(name)!");
    return;
}
//CALLING A FUNC
//sayHello()             -> Prints "Hello World
//sayHello(name: "WWDC") -> Prints "Hello WWDC

//FUNCTION WITH DEFAULT VALUE and Return Value
func buildAGreeting(name:String = "World") -> String
{
    return "Hello, \(name)" ;
}
//CALLING A FUNC
//let tmp:String = buildAGreeting()

//FUNCTION WITH DEFAULT VALUE and MULTIPLE Return Values - TUPLES
func refreshWebPage(name:String = "http://www.googel.com") -> (Int,String)
{
    return (200,"Success");
}

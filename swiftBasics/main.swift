//
//  main.swift
//  swiftBasics
//
//  Created by mar Jinn on 6/8/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

import Foundation

println("Hello, World!")

/*************/
/* Optionals */
/**************/

//NON OPTIONAL TYPES CANNOT BE NIL

var optionalNumber: Int?
//default value in "nil"
optionalNumber = 6

/**
retrieving an optional  value
**/
if(optionalNumber != nil)
{
    println("\(optionalNumber!)")
}
else
{
    println("\"(optionalNumber!)\"")
}

//################################
//Function
//###############################
func findIndexOfString(string:String, array:String[]) -> Int?
{
    for (index:Int,value:String) in enumerate(array)
    {
        if(value == string)
        {
            return index;
        }
    }
    
    return nil
}

var neighbours:String[];
neighbours = ["Alex","Anna","Madison","Dave"];

//function returns an optional integer
//so assign it to an optional variable
let index:Int? = findIndexOfString("Madison", neighbours);

//check for nil
if (index != nil)
{
    println("Hello , \(neighbours[index!])");
}
else
{
    println("Must've moved away");
}

//OR use a temp non optional var
if let indexValue:Int = index
{
    println("Hello , \(neighbours[indexValue])");
    
}
else
{
    println("Must've moved away");
}



/********************/
/* Optional binding */
/********************/
// uses the "if let" operator - tests and unwraps
// the variable used after "if let" is not of optional type
// also you cannot have "if let" in parantheses
// You dont have to force unwrap using unwrap (!) opeartor

if let __index:Int = findIndexOfString("Madison", neighbours)
{
    println("Hello , \(neighbours[__index])");
    
}
else
{
    println("Must've moved away");
}











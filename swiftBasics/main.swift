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

//Convert string to int
let stringVar:String = "6";
println("\(stringVar.toInt())");

//######################################
//Function - returning an optional type
//######################################
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
    println("Hello , \(neighbours[index!])");//force unwrapping with "!"
   
    /*
    println("Hello , \(neighbours[8])");
    
    fatal error: Array index out of range
    
*/
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
// the variable used after "if let" is non-optional type
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



/********************/
/*** CLASS ***/

// IF all the properties of a calss are of  type  optional
// you dont have to write a constructor ie initilaizer method

//Otherwise every non optional variable i.e. property  in a class
//should be initilized

/********************/
class Person
{
    var residence:Residence;
    
    /* initilaizer With Default values for all params*/
    init(_residence:Residence = Residence(_address: Address(_buildingNumber: "243",_streetName: "Main St.",_appartmentNumber: "")))
    {
        self.residence = _residence;
    }
    
//    init(_residence:Residence)
//    {
//        self.residence = _residence;
//    }
   
}

class Residence
{
    var address:Address;
    
    /* initilaizer */
    init(_address:Address)
    {
        self.address = _address;
    }
}

class Address
{
    var buildingNumber:String;
    var streetName:String;
    var appartmentNumber:String;
    
    /* initilaizer */
    init(_buildingNumber:String,_streetName:String,_appartmentNumber:String)
    {
        self.buildingNumber     = _buildingNumber;
        self.streetName         = _streetName;
        self.appartmentNumber   = _appartmentNumber;
     }
    
}

//Create and Instance of Person
let paul:Person = Person();/* uses Default initilaizer */
println("paul \n \(paul)"  );
println("paul.residence \n \(paul.residence)"  );
println("paul.residence.address \n \(paul.residence.address)"  );
println("paul.residence.address.buildingNumber \n \(paul.residence.address.buildingNumber)"  );
println("paul.residence.address.streetName \n \(paul.residence.address.streetName)"  );
println("paul.residence.address.appartmentNumber \n \(paul.residence.address.appartmentNumber)"  );


/********************************************/
/****** Class With Optionla Properties *//////
/********************************************/

class OtherPerson
{
    var residence:OtherResidence?;
    
}

class OtherResidence
{
    var otheraddress:OtherAddress?;
}

class OtherAddress
{
    var buildingNumber:String?;
    var streetName:String?;
    var appartmentNumber:String?;
}

let otherAddr:OtherAddress = OtherAddress();
otherAddr.appartmentNumber = "253";
otherAddr.streetName       = "Main St."

let otherresidence:OtherResidence   = OtherResidence();
otherresidence.otheraddress         = otherAddr;

let otherPaul:OtherPerson = OtherPerson();
otherPaul.residence       = otherresidence;

//Get building number which is a "String" as an "Int"
//Since it is an optional we use an optional var
var addressNumber:Int?

//To retrieve the value we need to check for nil (using if let) for every variable
//in otherPaul till we reach buildingNumber
if let home:OtherResidence = otherPaul.residence
{
    if let postalAddress:OtherAddress = home.otheraddress
    {
        if let building:String = postalAddress.buildingNumber
        {
            addressNumber = building.toInt();
            println("addressNumber \(addressNumber)");
        }
    }
}

/********************************************/
/**** OPTIONAL CHAINING *****/
/********************************************/
addressNumber = otherPaul.residence?.otheraddress?.buildingNumber?.toInt()
println("addressNumber \(addressNumber!)");


/************************************************/
/* Synchronous request with delegate - working  */
/************************************************/
//URLConnectionDelegate();

/********************************************/
//Closure Demo
/********************************************/
//ClosureAllKinds();



/********************************************/
//MEMORY MANAGEMENT - ARC
/********************************************/
class BowlingPin{}

func juggle(count:Int) -> Void
{
    var left:BowlingPin = BowlingPin();
    
    if(count > 1)
    {
        var right:BowlingPin = BowlingPin();
        
        right = left;
    
    }//RIGHT GOES OUT OF SCOPE

}//LEFT GOES OUT OF SCOPE

/*
left      right
  |         |
  |         |
  |         |
|-------------|
| BOWLING PIN |
|-------------|
 */


/********************************************/
 //WEAK REFERENCES
/********************************************/
class ApartMent
{
    var tenant:PerSon?;
}

class PerSon
{
    var home:ApartMent?;
    
    func monIn(apt:ApartMent) -> Void
    {
        self.home = apt;
        apt.tenant =  self;
        
    }//monIn

}//PerSon


var renters:Dictionary<String,PerSon> ;
renters = ["Elsvette":PerSon()];

var apts:Dictionary<Int,ApartMent>;
apts = [507: ApartMent()];

renters["Elsvette"]!.monIn(apts[507]!);
//We use "!" or force unwrapping beacuse dictionary subscripting returns optional type

renters["Elsvette"] = nil;

//still first PerSon isntance will not be deallocated as apts dict still has ApartMent instance which holds on to that

apts[507] = nil;
//PerSon instance holds on with  strong reference to ApartMent as it is still not deallocated

//Hence we have a strong reference cycle
//---------------------------------------

//to break this

class ApartMenT
{
    weak var tenant:PerSoN?;
}

class PerSoN
{
    weak var home:ApartMenT?;
    
    func monIn(apt:ApartMenT) -> Void
    {
        self.home = apt;
        apt.tenant =  self;
        
    }//monIn
    
}//PerSon


var renters_:Dictionary<String,PerSoN> ;
renters_ = ["Elsvette":PerSoN()];

var apts_:Dictionary<Int,ApartMenT>;
apts_ = [507: ApartMenT()];

renters_["Elsvette"]!.monIn(apts_[507]!);

//WE get a clean break

renters_["Elsvette"] = nil;
apts_[507] = nil;

//WEAK references are optional values
//BINDING the optional produces a strong reference

//TESTING a weak reference(simple if)alone does not prduce a strong reference
//Chaining doesn't preserve a strong reference b/w method invocations


/********************************************/
//UNOWNED REFERENCES - will not be set to nil
/********************************************/
/*
WEAK REFERENCES MUST ALWAYS BE OPTIONAL TYPES
IF WE ARE NOT USING AN OPTIONAL TYPE
TO BREAK RETAIN CYCLES WE CCOULD USE UNOWNED
*/
class Individual
{
    var card:CreditCarD?;
    
    func saveCard(Void) -> Void
    {
        return;
    }
}

class CreditCarD
{
    unowned let holder:Individual;//immutable reference
    
    init(cardHolder:Individual)
    {
        self.holder = cardHolder;
    }
}

var renters__:Dictionary<String,Individual> ;
renters__ = ["Elsvette":Individual()];

renters__["Elsvette"]!.saveCard();
renters__["Elsvette"] = nil;

/********************************************/
//INITIALIZATIONS
/********************************************/
//EVERY VALUE MUST BE INITIAZED BEFORE USE

var message:String;
//No default initialization except for optional whcih are set to "nil"

if ("YES")
{
    message = "YES";
}
else
{
    message = "NO";
}

println(message);
//IF Else condition is not specified
//You get "variable used before being initiliazed" error

//#1  init(...){}

/********************************************/
//STRUCTURE
/********************************************/

struct Color
{
    //Default values can be provided here as well
    let red:Double;
    let green:Double;
    let blue:Double;
    
    //Func that edits the array
    mutating func validateColor(Void) -> Void
    {
        return;
    }
    
    init(grayScale:Double)
    {
        red = grayScale;
        green = grayScale;
        
        //if validateColor() is called here
        //you get self.blue is passed by reference before being initialized
        //that means all initializatiosn should happen before calling any method
        //self.validateColor();
        blue = grayScale;
        
        self.validateColor();
    }
}


//DEFAULT MEMBER_WISE INITIALIZER - provided if no initializer is provided
//let magenta = Color(red:1.0,green:1.0,blue:1.0);

//DEFAULT INITIALIZER WITH NO INPUT PARAMETERS
//let Yellow:Color = Color();

/********************************************/
//CLASS
/********************************************/

class Car
{
    var paintColor:Color;
    
    init(color:Color)
    {
        self.paintColor = color;
    }
    
    //func
    func fillGasTank(Void) -> Void
    {
        return;
    }
}

/********************************************/
//SUBCLASS
/********************************************/

class RaceCar:Car
{
    var hasTurbo:Bool;
    
    override func fillGasTank(Void) -> Void
    {
        super.fillGasTank();
        return;
    }

    //DESIGNATED INITIALIZER
    init(color: Color,turbo:Bool)
    {
        self.hasTurbo = turbo;
        //UNLIKE OBJC SUPER init IS CALLED AFTER
        //ALL CUSTOM INITIALIZATIONS OF THE SUBCLASS
        super.init(color: color);
        
        
    }
    
    //CONVENIENCE INITIALIZER - calls designated initilizer
    convenience init(color:Color)
    {
        self.init(color:color,turbo: true);
    }
    
    //calls the other convenience
    convenience init()
    {
        self.init(color:Color(grayScale: 0.4));
    }
    
}


//CONVENIENCE INITIALIZER - INheritance


class FormulaOne: RaceCar
{
    let minimumWeight:Int = 642;
    
    //ALL INITS(convenience and designated) WILL BE INHRITED FROM SUPERCLASS
    //If we specify our 
    //OWN CUSTOM INIT IN THE SUB CLASS NO INITS WILL BE INHERITeD
    init(color: Color)
    {
        super.init(color: color, turbo: false);
    }
}

/********************************************/
//LAZY PROPERTIES
/********************************************/

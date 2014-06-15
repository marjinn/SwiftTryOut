//
//  AdvancedSwift.swift
//  swiftBasics
//
//  Created by mar Jinn on 6/15/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

import Foundation

/**************************************************/
//Changig Method Name
/**************************************************/

class Thing
{
    weak var location:Thing? ;
    var name:String ;
    var longDescription: String ;
    
//    //regular init
//    init(location:Thing?, name:String, longDescription:String)
//    {
//        return;
//    }
    
    //init With external names for each parameter
    init(location location:Thing?,name name:String, longDFescription longDescription:String)
    {
        
        self.name = name;
        self.longDescription = longDescription;
        return;
    }

        //init With external names for each parameter
    //IF the internal name and the external name are the same then 
    // it can beexpressed by using a "#" infront of
    init(#location:Thing?,#name:String, #longDescription:String)
    {
        self.name = name;
        self.longDescription = longDescription; 
        return;
    }

    deinit
    {
        println("\(self) is being deinitialized");
    }

}

typealias ThingMethodClass = Thing;

extension ThingMethodClass
{
   
    /*********************************************/
    //MAKING SOMETHING ANONYNMOUS WITH "_"
    /*********************************************/
    func anonymousMe (Void) -> Void
    {
        let dictionary:Dictionary<Int,String> =
        [1 : "One"];
        
        //enumerate to print out all the keys
        //"_" can be used to ignore variables that you don't use
        for (key:Int,_:String) in dictionary
        {
            println(key);
        }
        
        let color:Color = Color(grayScale: 0);
        
        var red:Int  = 0;
        var blue:Int = 0;
        
        //Underscores: "_" can be assigned value
        //rgba() returns  a tuple with values (1,1,1,1)
        //So "_" gets assigned to 1
        (red, _, blue, _) = color.rgba();
        
        return;
    }
    
    //INITIALIZER WITH NO ARGUMENT NAMES
    
      convenience init(_ location:Thing?,_ name:String,_ longDescription:String)
      {
        self.init(location:location,name:name,longDescription:longDescription);
        
        return;
      }
}

/*********************************************/
//PROTOCOLS
/*********************************************/
class Boards: Thing
{
    //fill me in make it pullable
}

@objc protocol Pullable
{
    func pull();
}


//ADOPT THE PROTOCOL
extension Boards:Pullable
{
    var location__:String
    {
        get
        {
            return self.location__;
        }
        set(location)
        {
            self.location__ = location;
        }
    
    }

    //PROTOCOL'S METHOD
    func pull()
    {
        if self.location__ === "location"
        {
            println("They will come off easily");
        }
        else
        {
            println("They won't come off easily");
        }
        
        return;
    }
}


//CHECK IF ANOBJECT ADOPTS THE PROTOCOL
/*

NOTE

You can check for protocol conformance only if your protocol is marked with the @objc attribute, as seen for the HasArea protocol above. This attribute indicates that the protocol should be exposed to Objective-C code and is described in Using Swift with Cocoa and Objective-C. Even if you are not interoperating with Objective-C, you need to mark your protocols with the @objc attribute if you want to be able to check for protocol conformance.

Note also that @objc protocols can be adopted only by classes, and not by structures or enumerations. If you mark your protocol as @objc in order to check for conformance, you will be able to apply that protocol only to class types.

*/


func performPull(obj: Thing)
{
    /*
    Checking for Protocol Conformance
    
    You can use the is and as operators described in Type Casting to check for protocol conformance, and to cast to a specific protocol. Checking for and casting to a protocol follows exactly the same syntax as checking for and casting to a type:
    
    The is operator returns true if an instance conforms to a protocol and returns false if it does not.
    The as? version of the downcast operator returns an optional value of the protocol’s type, and this value is nil if the instance does not conform to that protocol.
    The as version of the downcast operator forces the downcast to the protocol type and triggers a runtime error if the downcast does not succeed.
    */
    if let pullableObject = obj as? Pullable
    {
        /* pull */
        pullableObject.pull();
    }
    else
    {
        /* complain */
    }
}


/**************************************************/
//STRING INTERPOLATION
/**************************************************/
//SPECIAL PROTOCOLS - Compiler alreday knoiws about
/*

LogicValue                  if logicValue{
Printable                   "\(printable)"
Sequence                    for x in sequence
IntegerLiteralConvertible   65536
FloatLiteralConvertible     1.0
StringLiteralConvertible   "abc"
ArrayLiteralConvertible   [a, b, c]
DictionaryLiteralConvertible   [a:x, b:y]

*/

func stringInterPolation(Void) ->Void
{
    var darnText:Int? = "65".toInt()!
    println("Here printThis \(darnText!)");
}

/*
* In the above function the use \() is quite tedious
* So we adopt to the "Printable" protocol
*/
protocol Printable
{
    var Description: String { get } ;
}

//This offers a way to make an arbitrary class object printable
extension Thing: Printable
{
    var Description: String { return  self.name} ;
}

/*****************************/
//DECORATING A PRINTED STRING
/*******************************/
/*****************************/
//OVERLOADING AN OPERATOR
//WE want to write println("You aren't \(an ~ object)"
//object conforms to PRintable

/*******************************/
extension Thing
{
     var nameWithArtile: String
    {
    get
    {
        return self.nameWithArtile;
    }
    set(nameWithArticle)
    {
        self.nameWithArtile = nameWithArticle;
    }
    }
}

operator infix ~ {}

func ~ (decorator:(Thing) -> String, object:Thing) ->String
{
    //decorator is a closure that takes in an object and returns a string
    return decorator(object);
}

func an (object: Thing) -> String
{
    return object.nameWithArtile;
}

func lawD(Void) -> Void
{
//    let object:Thing = Thing("Thing()","14","2014");
//    println("You aren't \(an ~ object)")
}

enum Direction
{
    case North,South,East,West
}

class Place:Thing
{
    init(_ name:NSString, _ longDescription: String)
    {
        super.init(location:nil,name:name,longDescription:longDescription);
        return;
    }
    
    var exists:Dictionary<Direction, Place>
    {
      get
      {
        return self.exists;
      }
      set(exists)
      {
        self.exists = exists;
      }
    }
    
    
}

/**************************************************/
//GENERICS - From The Ground UP
/**************************************************/

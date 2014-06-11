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



/****** Class With Optionla Properties *//////
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

/**** OPTIONAL CHAINING *****/
addressNumber = otherPaul.residence?.otheraddress?.buildingNumber?.toInt()
println("addressNumber \(addressNumber)");



class UrlCon:NSObject,NSURLConnectionDelegate,NSURLConnectionDataDelegate
{
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!)
    {
        
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!)
    {
        
    }
    
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!)
    {
        
    }
}





var url:NSURL? = nil;
url = NSURL(string: "http://www.google.com");

var urlRequest:NSURLRequest? = nil;

var urlConnection:NSURLConnection? = nil;

if(url != nil)
{
    urlRequest = NSURLRequest(URL: url!)
    /*
    Closure expression syntax has the following general form:
    { (parameters) -> return type in
    statements
    }
    */
    
    func closureForUrlConnection(urlresponse:NSURLResponse!, data:NSData!, error:NSError!) -> Void
    {
        
        urlresponse ? println(" urlresponse \(urlresponse!)")   : println("urlresponse)");
        
        data        ? println("\(data!)")                       :  println("(data)")
        
        if (data)
        {
            let html:NSString =
            NSString(data: data!, encoding: NSUTF8StringEncoding);
            
            println("\(html)");
            
        }
        
        error       ? println("\(error!)")                      :  println("(error)")
    }
    
    if(urlRequest != nil)
    {
//        NSURLConnection.sendAsynchronousRequest(urlRequest!, queue: NSOperationQueue.mainQueue(), completionHandler:closureForUrlConnection);
        
        
        var url_Request:NSURLRequest?
        url_Request = NSURLRequest(URL: url!);
        
        println("\(url_Request)")
        
        var url_Response:AutoreleasingUnsafePointer<NSURLResponse>?;
        var url_Error:NSErrorPointer;
        var url_data:NSData?;
        
//        url_data =
//        NSURLConnection.sendSynchronousRequest(url_Request!, returningResponse:url_Response, error: url_Error)
        
//        url_data =
//        NSURLConnection.sendSynchronousRequest(request:url_Request, returningResponse: url_Response!, error: url_Error)
        
       
        
        
        
        
        var urlCon:UrlCon;
        urlCon = UrlCon();
        
        //Delegate doesnt Wok
        var urlConnection:NSURLConnection;
        urlConnection = NSURLConnection(request: url_Request!, delegate: urlCon );
        
        //ASynchronous request with closure - working
        // NSURLConnection.sendAsynchronousRequest(urlRequest!, queue: NSOperationQueue.mainQueue(), completionHandler:closureForUrlConnection);
       
    
        //Synchronous request with delegate - working
        //URLConnectionDelegate();
        
    
       NSRunLoop.currentRunLoop().runUntilDate(
        NSDate(timeInterval: 10.0, sinceDate: NSDate()))
        
    }
    else
    {
        println("addressNumber \(addressNumber)");
    }
    
}







    
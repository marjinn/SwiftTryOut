//
//  ARCInAction.swift
//  swiftBasics
//
//  Created by mar Jinn on 6/11/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

import Foundation

import Foundation

class Apartment
{
    let number:Int;
    
    init(number: Int)
    {
        self.number = number;
        return;
    }
    
    var apartment:Apartment?
    
    deinit
    {
        println("\(self) is being deinitialized");
    }
    
}

typealias Apartment_MethodCall = Apartment;

extension Apartment_MethodCall
{
    
}



class Person___
{
    let name:String;
    
    init(name:String)
    {
        self.name = name;
        
        println("\(name) is being initiliazed" );
        
        return;
    }
    
    deinit
    {
        println("\(name) is being deinitialized");
    }
}

typealias PersonMethodCall = Person___;

extension PersonMethodCall
{
    
}



/*****************************************************/
/************** Unowned References  **************/
/*****************************************************/



class Customer
{
    
    let name: String;
    var card: CreditCard?
    
    init(name:String)
    {
        self.name = name;
        return;
    }
    
    deinit
    {
        println("\(self.name) is being deinitialized");
    }
    
}

typealias CustomerMethodCalls = Customer;

extension CustomerMethodCalls
{
    
}


import Foundation

class CreditCard
{
    let number:Int;
    unowned let customer:Customer
    //__unsafe_unretained like reference to break retain cycle
    //could use weak also
    
    init(number:Int, customer:Customer)
    {
        self.number = number;
        self.customer = customer;
        
        return;
    }
    
    deinit
    {
        println("Card# \(self.number) is being deinitialized");
    }
    
}

typealias CreditCardMethodCalls = CreditCard;

extension CreditCardMethodCalls
{
   
    
}

func callCustomer(Void) -> Void
{
    var john: Customer? = nil;
    john = Customer(name: "John Appleseed");
    
    john!.card
        = CreditCard(number:1234_5678_9012_3456, customer: john!);
    
    john = nil;
    
    return;
}


/*****************************************************/
/**************                         **************/
/*****************************************************/

class ARCInAction
{
    init(name:String)
    {
        return;
    }
    
    deinit
    {
        println("\(self) is being deinitialized");
    }
}

typealias ARCInActionMethodCall = ARCInAction;

extension ARCInActionMethodCall
{
    func usePerson(Void) -> (Void)
    {
        
    }
}



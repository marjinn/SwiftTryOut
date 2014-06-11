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



class Person
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

typealias PersonMethodCall = Person;

extension PersonMethodCall
{
    
}








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



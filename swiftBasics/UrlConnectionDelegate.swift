//
//  UrlConnectionDelegate.swift
//  swiftBasics
//
//  Created by mar Jinn on 6/11/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

import Foundation

class URLConnectionDelegate:NSObject,NSURLConnectionDelegate,NSURLConnectionDataDelegate
{
    var urlToLoad:NSString? = nil;
    
    init(var loadThisUrl:NSString? = "http://www.example.com" )
    {
        super.init();
        
        if(self.urlToLoad)
        {
            loadThisUrl = self.urlToLoad!;
        }
        
        self.getStarted(loadThisUrl!);
        
    }

}



typealias urlConnectionDelegateMethods = URLConnectionDelegate;

extension urlConnectionDelegateMethods
{
    //NSurlCOnnectionDelegate MEthods
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!)
    {
        response ? println(" urlresponse \(response!)")   : println("response)");
        connection ? println(" urlresponse \(connection!)")   : println("connection)");
        
    }
    
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!)
    {

        data ? println(" data \(data!)")   : println("data)");
        connection ? println(" urlresponse \(connection!)")   : println("connection)");
        
    }
    
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!)
    {
        error ? println(" urlresponse \(error!)")   : println("error)");
        connection ? println(" urlresponse \(connection!)")   : println("connection)");
    }

}

typealias MethodCalls = URLConnectionDelegate;

extension MethodCalls
{
    func getStarted(var urlRequi:NSString?) -> Void
    {
        
        var URLToUse:NSString =
        "http://www.example.com";
        
        if(urlRequi)
        {
            URLToUse = urlRequi!;
        }
        
        //Expects an optional but I am passing  a non-optional type
        var urlActual:NSURL? = nil ;
        urlActual = NSURL(string: URLToUse);
        
        var request:NSURLRequest? = nil;
        if(urlActual)
        {
            request =
                NSURLRequest(URL: urlActual?,
                    cachePolicy:
                    NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData ,
                    timeoutInterval: 30.0);
        }
        
        var urlConnection:NSURLConnection? = nil;
        if(request)
        {
            urlConnection =
                NSURLConnection(request: request!,
                    delegate: self,
                    startImmediately: true);
        }
        
        
    }

}


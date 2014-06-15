//
//  JunkYard.swift
//  swiftBasics
//
//  Created by mar Jinn on 6/11/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

import Foundation
import CoreFoundation

class UrlCon:NSObject,NSURLConnectionDelegate,NSURLConnectionDataDelegate
{
//    
//    let coreF:CFStringRef;
//    
//    init(withcoref:CFStringRef)
//    {
//        self.coreF = withcoref;
//    }
    
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



func junk(Void)-> Void
{
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
}

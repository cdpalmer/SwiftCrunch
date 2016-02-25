//
//  Extensions.swift
//  SwiftCrunch
//
//  Created by Cody Palmer on 2/25/16.
//  Copyright © 2016 Teampalmer. All rights reserved.
//

import Foundation

extension Dictionary {
    static func loadJSONFromBundle(filename: String) -> Dictionary<String, AnyObject>? {
        if let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json") {
            
            var error: NSError?
            let data = NSData(contentsOfFile: path, options: NSDataReadingOptions(), error: &error)
            if let data = data {
                
                let dictionary: AnyObject? = NSJSONSerialization.JSONObjectWithData(data,
                    options: NSJSONReadingOptions(), error: &error)
                if let dictionary = dictionary as? Dictionary<String, AnyObject> {
                    return dictionary
                } else {
                    print("Level file '\(filename)' is not valid JSON: \(error!)")
                    return nil
                }
            } else {
                print("Could not load level file: \(filename), error: \(error!)")
                return nil
            }
        } else {
            print("Could not find level file: \(filename)")
            return nil
        }
    }
}
//
//  Cookie.swift
//  SwiftCrunch
//
//  Created by Cody Palmer on 2/19/16.
//  Copyright © 2016 Teampalmer. All rights reserved.
//

import SpriteKit

enum CookieType: Int, CustomStringConvertible {
    case Unknown = 0, Croissant, Cupcake, Danish, Donut, Macaroon, SugarCookie
    var spriteName: String {
        let spriteNames = [
            "Croissant",
            "Cupcake",
            "Danish",
            "Donut",
            "Macaroon",
            "SugarCookie"]
        
        return spriteNames[rawValue - 1]
    }
    
    var highlightedSpriteName: String {
        return spriteName + "-Highlighted"
    }
    
    static func random() -> CookieType {
        return CookieType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
    
    var description: String {
        return spriteName
    }
}

class Cookie: CustomStringConvertible {
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?  // Makes it an optional attribute.
    
    init(column: Int, row: Int, cookieType: CookieType) {
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
    
    var description: String {
        return "type:\(cookieType) square:(\(column),\(row))"
    }
}
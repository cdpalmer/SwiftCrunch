//
//  Level.swift
//  SwiftCrunch
//
//  Created by Cody Palmer on 2/19/16.
//  Copyright © 2016 Teampalmer. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9

class Level {
    private var tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)
    
    private var cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
    
    init(filename: String) {
        // 1
        if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) {
            // 2
            if let tilesArray: AnyObject = dictionary["tiles"] {
                // 3
                for (row, rowArray) in (tilesArray as! [[Int]]).enumerate() {
                    // 4
                    let tileRow = NumRows - row - 1
                    // 5
                    for (column, value) in (rowArray).enumerate() {
                        if value == 1 {
                            tiles[column, tileRow] = Tile()
                        }
                    }
                }
            }
        }
    }
    
    func cookieAtColumn(column: Int, row: Int) -> Cookie? {  // Cookie? Because not all grid cells will have a cookie.
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    func shuffle() -> Set<Cookie> {
        return createInitialCookies()
    }
    
    func tileAtColumn(column: Int, row: Int) -> Tile? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return tiles[column, row]
    }
    
    private func createInitialCookies() -> Set<Cookie> {
        var set = Set<Cookie>()
        
        // 1
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if tiles[column, row] != nil {
                    // 2
                    let cookieType = CookieType.random()
                    
                    // 3
                    let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                    cookies[column, row] = cookie
                    
                    // 4
                    set.insert(cookie)
                }
            }
        }
        return set
    }
}
//
//  Tile.swift
//  SwiftCrunch
//
//  Created by Cody Palmer on 2/24/16.
//  Copyright © 2016 Teampalmer. All rights reserved.
//

import Foundation

class Tile {
    private var tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)
    
    func tileAtColumn(column: Int, row: Int) -> Tile? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return tiles[column, row]
    }
}
//
//  Cell.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 09..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import Foundation


enum Tile: Equatable {
    case closed(flag: Bool = false), open(Open)
    var unrevealed: Bool {
        self == .closed(flag: false) || self == .closed(flag: true)
    }

    enum Open: Equatable {
        case mine, empty, number(Int)
    }
}

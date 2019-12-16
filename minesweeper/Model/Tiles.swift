//
//  Cells.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 09..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import Foundation

final class Tiles: ObservableObject {
    let height: Int
    let width: Int
    
    @Published var board: [[Tile]] = []

    private(set) var mines: [[Bool]] = []
    private(set) var numberOfMines: Int = 0

    var restOfCell: Int {
        var res = 0
        for row in board {
            res += row.filter({ $0.unrevealed }).count
        }        
        return res
    }
    
    init(height: Int, width: Int) {
        self.height = height
        self.width = width
        reset()
    }

    func reset() {
        board = Array(repeating: Array(repeating: Tile.closed(), count: width), count: height)
        numberOfMines = Int((Double(height + width) / 2.0) * 1.5)
        let minesRng = (Array(repeating: true, count: numberOfMines) + Array(repeating: false, count: width*height-numberOfMines)).shuffled()
        mines = [[Bool]]()

        for i in 0..<height {
            let start = i * width
            let end = start + width
            let slice = minesRng[start..<end]
            mines.append(Array(slice))
        }
    }
    
    @discardableResult
    func open(row: Int, col: Int, recursive: Bool = false) -> Bool {
        guard case .closed = board[row][col] else { return true }
        if mines[row][col] {
            if recursive { return true }
            board[row][col] = .open(.mine)
            return false
        }

        let indices = self.indices(row, col)
        let numberOfMines = indices.filter({ mines[$0.0][$0.1] }).count
        if numberOfMines == 0 {
            board[row][col] = .open(.empty)
            indices.filter({ board[$0.0][$0.1].unrevealed }).forEach { open(row: $0.0, col:$0.1, recursive: true) }
        } else {
            board[row][col] = .open(.number(numberOfMines))
        }
        return true
    }
    
    func indices(_ row: Int, _ col: Int) -> [(Int, Int)] {
        let res = [(row - 1, col - 1), (row, col - 1), (row + 1, col - 1), (row + 1, col), (row + 1, col + 1), (row, col + 1), (row - 1, col + 1), (row - 1, col)]
        return res.filter { 0 <= $0.0 && $0.0 < height && 0 <= $0.1 && $0.1 < width }
    }
}

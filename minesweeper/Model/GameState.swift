//
//  GamePlay.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 09..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class GameState: ObservableObject {
    @Published var scene: Scene = .playing
    @Published var tiles: Tiles
    private var cancellables: [AnyCancellable] = []
    private(set) var timing: Timing? = nil
    
    init(height: Int, width: Int) {
        self.tiles = Tiles(height:height, width:width)
        tiles.objectWillChange.sink { _ in self.objectWillChange.send() }.store(in: &cancellables)
        timing = Timing()
        timing?.start()
    }
    
    func openCell(row: Int, col: Int) {
        guard case .closed = self.tiles.board[row][col] else { return }
        withAnimation {
            if !self.tiles.open(row:row, col:col) {
                self.scene = .gameOver
                timing?.stop()
            } else if self.tiles.restOfCell == self.tiles.numberOfMines {
                self.scene = .gameClear
                timing?.stop()
            }
        }
    }
    
    func toggleFlag(row: Int, col: Int) {
        guard case .closed(let flag) = self.tiles.board[row][col] else { return }
        self.tiles.board[row][col] = .closed(flag: !flag)
    }
    
    func restartGame() {
        self.tiles.reset()
        self.scene = .playing
        timing = Timing()
        timing?.start()
    }
    
    enum Scene {
        case playing, gameOver, gameClear
    }
}

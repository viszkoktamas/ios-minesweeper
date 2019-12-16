//
//  TileView.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 09..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import SwiftUI

struct TileView: View {
    let row: Int
    let col: Int
    @EnvironmentObject private var gameManager: GameState
    
    var body: some View {
        view(with: gameManager.tiles.board[row][col])
            .minimumScaleFactor(0.1)
            .onTapGesture { self.gameManager.openCell(row: self.row, col: self.col) }
            .onLongPressGesture { self.gameManager.toggleFlag(row: self.row, col: self.col) }.border(Color.black.opacity(0.2), width: 2)
    }
    
    private func view(with state: Tile) -> AnyView {
        switch state {
        case .closed(let flag):
            return ZStack {
                Color.gray
                flag ? Text("🚩") : nil
            }.erased
        case .open(let openState):
            switch openState {
            case .mine:
                return Text("💣").erased
            case .number(let number):
                return Text(number.description).erased
            case .empty:
                return Text("").erased
            }
        }
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(row: 0, col: 0)
    }
}

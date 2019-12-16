//
//  TableView.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 09..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import SwiftUI

struct TableView: View {
    let (width, height): (Int, Int)
    @EnvironmentObject private var gameManager: GameState
    var body: some View {
        GeometryReader { geometry -> AnyView in
            let cellSize = CGFloat(geometry.size.width) / CGFloat(self.gameManager.tiles.width)
            return VStack(spacing: 0) {
                ForEach(0..<self.height) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<self.width) { col in
                            TileView(row: row, col: col)
                                .frame(width: cellSize, height: cellSize)
                        }
                    }
                }
            }.erased
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(width: 5, height: 5)
    }
}

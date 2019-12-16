//
//  GameView.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 08..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var gameManager: GameState
    var difficulty:Int
    var height:Int
    var width:Int
    init(height: Int, width: Int, difficulty: Int) {
        self.difficulty = difficulty
        self.height = height
        self.width = width
        self.gameManager = GameState(height: height, width: width)
    }
    var body: some View {
        VStack {
            if gameManager.scene == .playing {
                gameManager.timing.map(TimerView.init)
                TableView(width: width, height: height).environmentObject(gameManager).erased
            } else if gameManager.scene == .gameClear {
                WinGamePopup(difficulty: difficulty, score: Int(gameManager.timing?.playingTime ?? 0), afterSave: {
                    self.presentationMode.wrappedValue.dismiss()
                }).erased
            } else {
                EndGamePopup(title: "Game Over", titleColor: .red, tapRestart: gameManager.restartGame).erased
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(height:15, width:10, difficulty:3)
    }
}

extension View {
    var erased: AnyView { AnyView(self) }
}

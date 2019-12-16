//
//  WinGamePopup.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 16..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import SwiftUI
import CoreData

struct WinGamePopup: View {
    let difficulty: Int
    let score: Int
    let afterSave: () -> Void
    @State var name: String = ""
    var body: some View {
        let idx = CoreDataManager.shared.getScoreIndex(score: score, difficulty: difficulty)
        
        let difficultyName = difficulty == 0 ? "Beginner" : difficulty == 1 ? "Intermediate" : "Advanced"
        
        return VStack() {
            if idx < 10 {
                Text("Your score is \(idx + 1). in \(difficultyName) highscores!")
                TextField("Type your name here", text:self.$name)
                    .padding()
                Button(action: {
                    CoreDataManager.shared.saveScore(difficulty: self.difficulty, name: self.name, score: self.score)
                    self.afterSave()
                }) {
                    Text("Save score")
                }
            } else {
                Text("Your time is not in the best 10 highscores!")
                Button(action: {
                    self.afterSave()
                }) {
                    Text("OK")
                }
            }
        }.padding()
    }
}

struct WinGamePopup_Previews: PreviewProvider {
    static var previews: some View {
        WinGamePopup(difficulty: 0, score: 10, afterSave: {})
    }
}

//
//  EndGamePopup.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 09..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import SwiftUI

struct EndGamePopup: View {
    let title: String
    let titleColor: Color
    let tapRestart: () -> Void
    var body: some View {
        VStack {
            Text(title).foregroundColor(titleColor).font(.title)
            Button("Restart", action: tapRestart)
        }
    }
}

struct EndGamePopup_Previews: PreviewProvider {
    static var previews: some View {
        EndGamePopup(title: "Game Over", titleColor: .red, tapRestart: {}).erased
    }
}

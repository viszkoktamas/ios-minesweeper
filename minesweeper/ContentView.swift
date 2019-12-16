//
//  ContentView.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 08..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import SwiftUI

enum Screens {
    case MainMenu
    case PlayBeginner
    case PlayMedium
    case PlayHard
    case Scores
}

struct ContentView: View {
    @State var selection: Int? = nil
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Image("minesweeper")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                NavigationLink(
                    destination: GameView(height: 5, width: 5, difficulty: 0)
                        .navigationBarTitle("Beginner", displayMode: .inline)
                        .font(Font.system(.headline, design: Font.Design.monospaced))
                        .foregroundColor(.primary),
                    tag: 1,
                    selection: $selection
                ){
                    Button(action: {
                        self.selection = 1
                    }) {
                        Text("Play Beginner")
                            .font(.title)
                    }
                }
                NavigationLink(
                    destination: GameView(height: 10, width: 7, difficulty: 1)
                        .navigationBarTitle("Intermediate", displayMode: .inline)
                        .font(Font.system(.headline, design: Font.Design.monospaced))
                        .foregroundColor(.primary),
                    tag: 2,
                    selection: $selection
                ){
                    Button(action: {
                        self.selection = 2
                    }) {
                        Text("Play Intermediate")
                            .font(.title)
                    }
                }
                NavigationLink(
                    destination: GameView(height: 15, width: 10, difficulty: 2)
                        .navigationBarTitle("Advanced", displayMode: .inline)
                        .font(Font.system(.headline, design: Font.Design.monospaced))
                        .foregroundColor(.primary),
                    tag: 3,
                    selection: $selection
                ){
                    Button(action: {
                        self.selection = 3
                    }) {
                        Text("Play Advanced")
                            .font(.title)
                    }
                }
                NavigationLink(
                    destination: ScoresView(),
                    tag: 4,
                    selection: $selection
                ){
                    Button(action: {
                        self.selection = 4
                        
                    }) {
                        Text("Scores")
                            .font(.title)
                    }
                }
                Spacer()
            }
            .navigationBarTitle("Menu", displayMode: .inline)
            .font(Font.system(.headline, design: Font.Design.monospaced))
            .foregroundColor(.primary)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
                .previewDevice("iPhone 8")
            ContentView()
        }
        
    }
}

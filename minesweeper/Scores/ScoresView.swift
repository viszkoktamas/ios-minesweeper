//
//  ScoresView.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 08..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import SwiftUI

struct ScoresView: View {
    
    @State var selectedDifficulty: Int = 0
    
    var body: some View {
        VStack(spacing:0) {
            Button(action: {
                withAnimation {
                    self.selectedDifficulty = 0
                }
            }) {
                ScoreTitle(text: "Beginner", up:self.selectedDifficulty == 0)
            }
            ScoreList(list:CoreDataManager.shared.getScoresByDifficulty(0).map(ScoreModel.init))
                .layoutPriority(self.selectedDifficulty == 0 ? 1 : 0.1)
            
            Button(action: {
                withAnimation {
                    self.selectedDifficulty = 1
                }
            }) {
                ScoreTitle(text: "Intermediate", up:self.selectedDifficulty == 1)
            }
            ScoreList(list:CoreDataManager.shared.getScoresByDifficulty(1).map(ScoreModel.init))
                .layoutPriority(self.selectedDifficulty == 1 ? 1 : 0)
            
            Button(action: {
                withAnimation {
                    self.selectedDifficulty = 2
                }
            }) {
                ScoreTitle(text: "Advanced", up:self.selectedDifficulty == 2)
            }
            ScoreList(list:CoreDataManager.shared.getScoresByDifficulty(2).map(ScoreModel.init))
                .layoutPriority(self.selectedDifficulty == 2 ? 1 : 0.1)
        }.padding()
        
    }
}

struct ScoreTitle: View {
    var text:String
    var up:Bool
    var body: some View {
        HStack {
            Spacer()
            Text(text).foregroundColor(.white).font(.title).padding(.all, 10)
            Spacer()
        }.background(Color.gray).overlay(Image(systemName: "chevron.\(up ? "up" : "down").square").offset(x:-20), alignment: .trailing)
    }
}

struct ScoreList: View {
    var list:[ScoreModel]
    var body: some View {
        VStack(spacing:5){
            if self.list.count > 0 {
                List {
                    ForEach(0..<list.count) { i in
                        HStack {
                            Text("\(i + 1).").foregroundColor(.white).font(.headline).padding()
                            Text(self.list[i].name).foregroundColor(.white).font(.headline).padding()
                            Spacer()
                            Text("\(self.list[i].score) s").foregroundColor(.white).font(.headline).padding()
                        }.background(Color.gray).cornerRadius(10)
                    }
                }.listRowInsets(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
            } else {
                List{
                    HStack {
                        Spacer()
                        Text("No highscores yet.").foregroundColor(.gray).font(.headline).padding()
                        Spacer()
                    }
                }.listRowInsets(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
            }
        }.padding(.all, 2)
    }
}


struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
    }
}

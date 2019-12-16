//
//  CoreDataManager.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 16..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func saveScore(difficulty: Int, name: String, score:Int) {
        let scores = getScoresByDifficulty(difficulty)
        var index:Int = 0
        for s in scores {
            if score < s.score {
                break
            }
            index += 1
        }
        if index > 9 { return }
        if scores.count > 9 {
            moc.delete(scores[9])
        }
        let scoreData = Score(context: moc)
        scoreData.difficulty = Int16(difficulty)
        scoreData.name = name
        scoreData.score = Int32(score)
        
        do {
            try CoreDataManager.shared.moc.save()
        } catch {
            print(error)
        }
    }
    
    func getScoreIndex(score: Int, difficulty: Int) -> Int {
        let scores = getScoresByDifficulty(difficulty)
        var index:Int = 0
        for s in scores {
            if score < s.score {
                break
            }
            index += 1
        }
        return index
    }
    
    func getScoresByDifficulty(_ difficulty: Int) -> [Score] {
        return getAllScores().filter { (sm: Score) -> Bool in
            sm.difficulty == difficulty
        }.sorted { $0.score < $1.score }
    }
    
    func getAllScores() -> [Score] {
        var scores = [Score]()
        let req: NSFetchRequest<Score> = Score.fetchRequest()
        
        do {
            scores = try self.moc.fetch(req)
        } catch let error as NSError {
            print(error)
        }
        
        return scores
    }
}

//
//  Score.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 09..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import Foundation
import CoreData

class ScoreModel: Comparable, Identifiable {
    static func < (lhs: ScoreModel, rhs: ScoreModel) -> Bool {
        lhs.score < rhs.score
    }
    
    static func == (lhs: ScoreModel, rhs: ScoreModel) -> Bool {
        lhs.score == rhs.score
    }
    
    var difficulty:Int
    var score:Int
    var name:String
    
    init(score: Score) {
        self.difficulty = Int(score.difficulty)
        self.score = Int(score.score)
        self.name = score.name ?? ""
    }
}

//public class Score: NSManagedObject, Identifiable {
//    @NSManaged public var createdAt:Date?
//    @NSManaged public var difficulty:NSNumber?
//    @NSManaged public var score:NSNumber?
//    @NSManaged public var name:String?
//}
//
//extension Score {
//    static func getAllScores(difficulty: Int) -> NSFetchRequest<Score> {
//        let request:NSFetchRequest<Score> = Score.fetchRequest() as! NSFetchRequest<Score>
//        let sortDescriptor = NSSortDescriptor(key: "score", ascending: true)
//        request.sortDescriptors = [sortDescriptor]
//        request.predicate = NSPredicate(format: "difficulty = \(difficulty)", argumentArray: [true])
//        return request
//    }
//}
//    static func < (lhs: Score, rhs: Score) -> Bool {
//        lhs.score < rhs.score
//    }
//
//    var name:String
//    var score:Int
//
//    init(_ code: String) {
//        let values = code.split(separator: "@")
//        name = String(values[0])
//        score = Int(String(values[1]))!
//    }
//
//    init(name: String, score: Int) {
//        self.name = name
//        self.score = score
//    }
//
//    func toCode() -> String {
//        return "\(self.name)@\(self.score)"
//    }
//}

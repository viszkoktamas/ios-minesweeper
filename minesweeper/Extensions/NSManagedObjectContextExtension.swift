//
//  NSManagedObjectContextExtension.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 16..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

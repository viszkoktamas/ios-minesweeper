//
//  Timing.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 09..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import Foundation

final class Timing: ObservableObject {
    @Published private(set) var playingTime: TimeInterval = 0
    
    private var timer: Timer?
    
    func start() {
        playingTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1,
                                     repeats: true) { [weak self] _ in self?.playingTime += 1 }
        timer?.fire()
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
}

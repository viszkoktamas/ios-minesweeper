//
//  TimerView.swift
//  minesweeper
//
//  Created by Tomi on 2019. 12. 09..
//  Copyright © 2019. Tamas Viszkok. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject var timing: Timing
    
    var body: some View {
        return Text(timing.playingTime.str)
            .foregroundColor(Color.secondary)
            .fontWeight(.semibold)
            .font(Font.system(size: 14))
            .shadow(radius: 5)
    }
}

private extension TimeInterval {
    var str: String {
        return String(format: "%02d:%02d", Int(self / 60), Int(truncatingRemainder(dividingBy: 60)))
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        let timing = Timing()
        timing.start()
        return TimerView(timing: timing)
    }
}

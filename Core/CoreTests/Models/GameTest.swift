//
//  Created by Peter Combee on 11/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class GameTest: XCTestCase {
    
    func test_players() {
        let entries = [
            Entry(player: "Stoffers", score: 100),
            Entry(player: "Anke", score: 100),
            Entry(player: "Peter", score: 100),
            Entry(player: "Stoffers", score: 100),
            Entry(player: "Anke", score: 100),
            Entry(player: "Peter", score: 100)
        ]
        let sut = Game(entries: entries)
        
        
    }
}

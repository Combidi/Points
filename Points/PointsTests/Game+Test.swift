//
//  Created by Peter Combee on 13/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Points
import Core

class GameExtensionsTest: XCTestCase {
    
    func test_sortedPlayers() {
        let anke = Player(name: "Anke")
        let stoffers = Player(name: "Stoffers")
        let peter = Player(name: "Peter")
        let game = Game(entries: [
            .init(player: stoffers, score: 100),
            .init(player: anke, score: 200),
            .init(player: peter, score: 300),
            .init(player: peter, score: 400)
        ])
        let expected = [anke, peter, stoffers]
        XCTAssertEqual(game.sortedPlayers, expected)
    }
}

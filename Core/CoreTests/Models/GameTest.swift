//
//  Created by Peter Combee on 11/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class GameTest: XCTestCase {
    
    func test_players() {
        let anke = Player(name: "Anke")
        let peter = Player(name: "Peter")
        let stoffers = Player(name: "Stoffers")
        let entries = [
            Entry(player: stoffers, score: 100),
            Entry(player: anke, score: 100),
            Entry(player: peter, score: 100),
            Entry(player: stoffers, score: 100),
            Entry(player: anke, score: 100),
            Entry(player: peter, score: 100)
        ]
        let sut = Game(entries: entries)
        XCTAssertEqual(sut.players.count, 3)
        XCTAssertTrue(sut.players.contains(stoffers))
        XCTAssertTrue(sut.players.contains(anke))
        XCTAssertTrue(sut.players.contains(peter))
    }
}

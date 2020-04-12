//
//  Created by Peter Combee on 12/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class PlayerActionHandlerTest: XCTestCase, AppActionHandlerTestCase {
    
    var sut: PlayerActionHandler!
    
    override func setUp() {
        sut = PlayerActionHandler()
    }
    
    func test_handleAction_AddPlayerAction_addsNewPlayer() {
        let playerName = "Peter"
        let action = AddPlayerAction(name: playerName)
        let state = makeAppState(players: [makePlayer()])
        var capturedState: AppState?
        handle(action, getState: { state }, setState: { capturedState = $0 })
        XCTAssertEqual(capturedState?.players.count, 2)
        XCTAssertTrue(capturedState?.players.contains { $0.name == playerName } ?? false)
    }
}

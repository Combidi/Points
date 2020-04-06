//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class GameActionHandlerTest: XCTestCase {
    
    func test_handleNewGameAction_addsNewGameToState() {
        let sut = GameActionHandler()
        let action = NewGameAction()
        let state = makeAppState(games: [makeGame()])
        var capturedState: AppState?
        sut.handle(action, getState: { state }, setState: { capturedState = $0 }, dispatch: {_ in})
        XCTAssertEqual(capturedState?.games.count, 2)
    }
    
    
}

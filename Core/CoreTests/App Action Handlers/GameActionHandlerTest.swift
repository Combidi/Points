//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class GameActionHandlerTest: XCTestCase, AppActionHandlerTestCase {
        
    var sut: GameActionHandler!
    
    override func setUp() {
        sut = GameActionHandler()
    }
    
    func test_handleAction_NewGameAction_addsNewGame() {
        let expectedPlayers: Set<Player> = [
            makePlayer(),
            makePlayer()
        ]
        let action = NewGameAction(for: expectedPlayers)
        let state = makeAppState(games: [makeGame()])
        var capturedState: AppState?
        handle(action, getState: { state }, setState: { capturedState = $0 })
        XCTAssertEqual(capturedState?.games.count, 2)
        XCTAssertEqual(capturedState?.games.last?.players, expectedPlayers)
        XCTAssertTrue(capturedState?.games.last?.entries.isEmpty ?? false)
    }
    
    func test_handleAction_whereActionIsOfWrongType_doesNotAddNewGame() {
        var capturedState: AppState?
        handle(WrongAction(), setState: { capturedState = $0 })
        XCTAssertNil(capturedState)
    }
    
    func test_handleAction_DeleteGameAction_deletesGamesInIndexSet() {
        let expectedGames = [Game].init(repeating: makeGame(), count: 2)
        let state = makeAppState(games: .init(repeating: makeGame(), count: 5) + expectedGames)
        let indexSet = IndexSet(integersIn: 0..<5)
        let action = DeleteGameAction(indexSet: indexSet)
        var capturedState: AppState?
        handle(action, getState: { state }, setState: { capturedState = $0 })
        XCTAssertEqual(capturedState?.games, expectedGames)
    }    
}

fileprivate struct WrongAction: Core.Action {}

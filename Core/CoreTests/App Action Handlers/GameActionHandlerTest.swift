//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class GameActionHandlerTest: XCTestCase {
    
    private var sut: GameActionHandler!
    
    override func setUp() {
        sut = GameActionHandler()
    }
    
    func test_handleAction_NewGameAction_addsNewGame() {
        let action = NewGameAction()
        let state = makeAppState(games: [makeGame()])
        var capturedState: AppState?
        handle(action, getState: { state }, setState: { capturedState = $0 })
        XCTAssertEqual(capturedState?.games.count, 2)
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

    // MARK: - Helpers
    func handle(
        _ action: Action,
        getState: () -> AppState = { makeAppState() },
        setState: @escaping (AppState) -> Void,
        dispatch: @escaping (Action) -> Void = {_ in}
    ) {
        sut.handle(action, getState: getState, setState: setState, dispatch: dispatch)
    }
}

fileprivate struct WrongAction: Core.Action {}

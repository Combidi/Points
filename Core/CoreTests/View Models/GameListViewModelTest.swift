//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
import Combine
@testable import Core

class GameListViewModelTest: XCTestCase {
    
    private var subscriptions = Set<AnyCancellable>()
    
    func test_updatingGames() {
        
        let store = StoreSpy()
        let sut = GameListViewModel(store: store)
        
        var capturedGames: [Game] = []
        sut.$games
            .sink(receiveValue: {
                capturedGames = $0
            })
            .store(in: &subscriptions)
        
        let expectedGames = [Game(), Game()]
        let state = AppState(games: expectedGames)
        store.set(state: state)
    
        XCTAssertEqual(capturedGames, expectedGames)
    }
    
    func test_addGame_dispatchesRightAction() {
        
        let store = StoreSpy()
        let sut = GameListViewModel(store: store)
    
        sut.addGame()
        XCTAssert(store.capturedAction is NewGameAction)
    }
    
    func test_deleteGamesInIndexSet_dispatchesRightAction() {

        let store = StoreSpy()
        let sut = GameListViewModel(store: store)

        let indexSet = IndexSet(integersIn: 1..<10)
        sut.deleteGames(in: indexSet)
        
        let expected = DeleteGameAction(indexSet: indexSet)
        
        XCTAssert(store.capturedAction is DeleteGameAction)
        XCTAssertEqual(
            store.capturedAction as? DeleteGameAction,
            expected
        )
    }
}

class StoreSpy: Store<AppState, ComposableAppActionHandler> {
    
    init() {
        super.init(state: makeAppState(), actionHandler: ComposableAppActionHandler(handlers: []))
    }
    
    var capturedAction: Action?
    
    override func dispatch(_ action: Action) {
        capturedAction = action
    }
}

private struct Handler: ActionHandler {
    func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void) {
    }
}

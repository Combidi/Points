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
        
        let store = makeStore()
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
}

private func makeStore() -> Store<AppState, ComposableAppActionHandler> {
    Store(state: makeAppState(), actionHandler: ComposableAppActionHandler(handlers: []))
}

private struct Handler: ActionHandler {
    func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void) {
    }
}

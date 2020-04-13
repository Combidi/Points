//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
import Combine
@testable import Core

class GameListViewModelTest: XCTestCase {
    
    private var store: StoreSpy!
    private var sut: GameListViewModel!
    
    override func setUp() {
        store = StoreSpy()
        sut = GameListViewModel(store: store)
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    func test_updatingGames() {
        
        var capturedGames: [Game] = []
        sut.$games
            .sink(receiveValue: {
                capturedGames = $0
            })
            .store(in: &subscriptions)
        
        let expectedGames = [makeGame(), makeGame()]
        let state = AppState(games: expectedGames)
        store.set(state: state)
    
        XCTAssertEqual(capturedGames, expectedGames)
    }
    
    func test_addGame_dispatchesRightAction() {
            
        sut.addGame()
        
        XCTAssert(store.capturedAction is NewGameAction)
    }
    
    func test_deleteGamesInIndexSet_dispatchesRightAction() {

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

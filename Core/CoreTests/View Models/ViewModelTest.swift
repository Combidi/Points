//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
import Combine
@testable import Core

class ViewModelTest: XCTestCase {
    
    private var store: StoreSpy!
    private var sut: ViewModel!
    
    override func setUp() {
        store = StoreSpy()
        sut = .init(store: store)
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
        
    func test_playersReflectState() {
        
        var capturedPlayers: [Player] = []
        sut.$players
            .sink(receiveValue: {
                capturedPlayers = $0
            })
            .store(in: &subscriptions)

        let expectedPlayers = [makePlayer(), makePlayer()]
        let state = AppState(players: expectedPlayers)
        store.set(state: state)
        
        XCTAssertEqual(capturedPlayers, expectedPlayers)
    }
    
    func test_addPlayer_dispatchesRightAction() {
        
        let name = String.random()
        
        sut.addPlayer(name)
        
        let expected = AddPlayerAction(name: name)
        XCTAssertEqual(store.capturedAction as? AddPlayerAction, expected)
    }
    
    func test_deleteGamesInIndexSet_dispatchesRightAction() {

        let indexSet = IndexSet(integersIn: 1..<10)
        sut.deleteGames(indexSet)
        
        let expected = DeleteGameAction(indexSet: indexSet)
        
        XCTAssert(store.capturedAction is DeleteGameAction)
        XCTAssertEqual(
            store.capturedAction as? DeleteGameAction,
            expected
        )
    }
    
    func test_addGameForPlayers_dispatchesRightAction() {
        
        let players: Set<Player> = [
            makePlayer(),
            makePlayer()
        ]
        sut.addGame(players)
        
        let expected = NewGameAction(for: players)
        XCTAssertTrue(store.capturedAction is NewGameAction)
        XCTAssertEqual(store.capturedAction as? NewGameAction, expected)
    }
}

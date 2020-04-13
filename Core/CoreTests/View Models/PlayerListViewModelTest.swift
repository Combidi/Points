//
//  Created by Peter Combee on 12/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
import Combine
@testable import Core

class PlayerListViewModelTest: XCTestCase {
    
    private var store: StoreSpy!
    private var sut: PlayerListViewModel!
    
    override func setUp() {
        store = StoreSpy()
        sut = PlayerListViewModel(store: store)
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    func test_updatingPlayers() {
        
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
}

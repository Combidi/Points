//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class MakeAppStoreTest: XCTestCase {
    
    func test_installsRightActionHandlers() {
        let storage = Storage()
        let sut = makeAppStore(storage: storage)
        XCTAssertEqual(sut.actionHandler.handlers.count, 3)
        XCTAssertTrue(sut.actionHandler.handlers.contains(where: { $0 is GameActionHandler }))
        XCTAssertTrue(sut.actionHandler.handlers.contains(where: { $0 is PlayerActionHandler }))
        XCTAssertTrue(sut.actionHandler.handlers.contains(where: { $0 is StorageActionHandler }))
    }
}

private struct Storage: Core.Storage {
    func loadAppState() -> AppState { fatalError() }
    func store(appState: AppState) { fatalError() }
}

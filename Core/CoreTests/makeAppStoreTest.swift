//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class MakeAppStoreTest: XCTestCase {
    
    func test_installsRightActionHandlers() {
        let sut = makeAppStore()
        XCTAssertEqual(sut.actionHandler.handlers.count, 1)
        XCTAssertTrue(sut.actionHandler.handlers.first is GameActionHandler)
    }
}

//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class MakeAppStoreTest: XCTestCase {
    
    func test_installsRightActionHandlers() {
        let sut = makeAppStore()
        XCTAssertTrue(sut.actionHandler.handlers.isEmpty)
    }
}

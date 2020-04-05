//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class ComposableAppActionHandlerTest: XCTestCase {
 
    func test_passesRightActionToAppActionHandlers() {
        let handlers = [AppActionHandlerSpy(), AppActionHandlerSpy()]
        let sut = ComposableAppActionHandler(handlers: handlers)
        let action = ActionStub()
        sut.handle(action, getState: { AppState() }, setState: {_ in}, dispatch: {_ in})
        handlers.forEach {
            XCTAssert($0.capturedAction === action)
        }
    }
}

private class ActionStub: Action {
    
}

private class AppActionHandlerSpy: AppActionHandler {
    
    var capturedAction: ActionStub?
    
    func handle(_ action: Action, getState: () -> AppState, setState: (AppState) -> Void, dispatch: (Action) -> Void) {
        capturedAction = action as? ActionStub
    }
}

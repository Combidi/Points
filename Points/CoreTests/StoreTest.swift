//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class StoreTests: XCTestCase {

    func test_dispatch_passesActionActionHandler() {
        let actionHandler = TestActionHandler()
        let sut = Store(state: StateStub(), actionHandler: actionHandler)
        let action = ActionStub()
        sut.dispatch(action)
        XCTAssert(actionHandler.capturedAction === action)
    }
    
    func test_dispatch_sendsRightStateToActionHandler()  {
        let state = StateStub()
        let actionHandler = TestActionHandler()
        let sut = Store(state: state, actionHandler: actionHandler)
        sut.dispatch(ActionStub())
        XCTAssert(state == actionHandler.capturedState)
    }
    
    func test_dispatch_actionHandlersCanModifyState() {
        let expected = StateStub(value: 19)
        let actionHandler = TestActionHandler(stateStub: expected, actionToDispatch: nil)
        let sut = Store(state: StateStub(), actionHandler: actionHandler)
        sut.dispatch(ActionStub())
        XCTAssert(sut.state == expected)
    }
    
    func test_dispatch_actionHandlersCanDispatchNewActions() {
        let secondAction = ActionStub()
        let actionHandler = TestActionHandler(stateStub: .init(), actionToDispatch: secondAction)
        let sut = Store(state: StateStub(), actionHandler: actionHandler)
        let firstAction = ActionStub()
        sut.dispatch(firstAction)
        XCTAssert(actionHandler.capturedActions.count == 2)
        let expected = [firstAction, secondAction]
        let result = actionHandler.capturedActions
        zip(expected, result).forEach {
            XCTAssert($0 === $1)
        }
    }
}

struct StateStub: Equatable {
    var value: Int = 0
}

class TestActionHandler: ActionHandler {
        
    let stateStub: StateStub
    var actionToDispatch: ActionStub?
    
    init(stateStub: StateStub = StateStub(), actionToDispatch: ActionStub? = nil) {
        self.stateStub = stateStub
        self.actionToDispatch = actionToDispatch
    }
    
    var capturedActions: [ActionStub] = []
    var capturedAction: ActionStub? { capturedActions.first }
    var capturedState: StateStub?
    
    func handle(_ action: Action, getState: () -> StateStub, setState: (StateStub) -> Void, dispatch: (Action) -> Void) {
        capturedActions.append(action as! ActionStub)
        capturedState = getState()
        setState(stateStub)
        if let secondAction = actionToDispatch {
            actionToDispatch = nil
            dispatch(secondAction)
        }
    }
}

class ActionStub: Action {}

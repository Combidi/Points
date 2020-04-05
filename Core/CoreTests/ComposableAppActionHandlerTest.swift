//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class ComposableAppActionHandlerTest: XCTestCase {
 
    private var handlers: [AppActionHandlerSpy]!
    private var sut: ComposableAppActionHandler!
    
    override func setUp() {
        handlers = [AppActionHandlerSpy(), AppActionHandlerSpy()]
        sut = ComposableAppActionHandler(handlers: handlers)
    }
    
    func test_handleAction_passesRightActionToAppActionHandlers() {
        let action = ActionStub()
        handle(action)
        handlers.forEach {
            XCTAssert($0.capturedAction === action)
        }
    }
    
    func test_handleAction_passesRightStateToActionHandlers() {
        let expectedState = makeAppState()
        handle(getState: { expectedState })
        handlers.forEach {
            XCTAssertEqual($0.capturedState, expectedState)
        }
    }
    
    func test_handleAction_passesSetStateToActionHandlers() {
        var capturedState: AppState?
        let expectedState = makeAppState()
        handle(setState: { capturedState = $0 })
        handlers.forEach {
            $0.set(state: expectedState)
            XCTAssertEqual(capturedState, expectedState)
        }
    }
    
    func test_handleAction_canDispatchActions() {
        var capturedAction: ActionStub?
        let expectedAction = ActionStub()
        handle(dispatch: { capturedAction = $0 as? ActionStub })
        handlers.forEach {
            $0.dispatch(action: expectedAction)
            XCTAssertTrue(capturedAction === expectedAction)
        }
    }
    
    // MARK: - Helpers
    private func handle(
        _ action: Action = ActionStub(),
        getState: () -> AppState = { makeAppState() },
        setState: @escaping (AppState) -> Void = {_ in},
        dispatch: @escaping (Action) -> Void = {_ in}
    ) {
        sut.handle(action, getState: getState, setState: setState, dispatch: dispatch)
    }
}

private class ActionStub: Action {}

private class AppActionHandlerSpy: AppActionHandler {
    
    var capturedAction: ActionStub?
    var capturedState: AppState?
    
    private var capturedSetState: ((AppState) -> Void)?
    
    func set(state: AppState) {
        capturedSetState?(state)
    }
    
    private var capturedDispatch: ((Action) -> Void)?
    
    func dispatch(action: ActionStub) {
        capturedDispatch?(action)
    }
    
    func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void) {
        capturedAction = action as? ActionStub
        capturedState = getState()
        capturedSetState = setState
        capturedDispatch = dispatch
    }
}

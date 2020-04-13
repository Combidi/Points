//
//  Created by Peter Combee on 13/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Core

class StorageActionHandlerTest: XCTestCase, AppActionHandlerTestCase {
    
    var sut: StorageActionHandler!
    
    func test_handleAction_whereActionIsLoadAction_loadsAppState() {
        let expected = makeAppState()
        let storage = Storage()
        storage.stub = expected
        sut = StorageActionHandler(storage: storage)
        let action = LoadAction()
        var capturedState: AppState?
        handle(action, setState: { capturedState = $0 })
        XCTAssertEqual(capturedState, expected)
    }
    
    func test_handleAction_whereActionIsSaveAction_savesAppState() {
        let storage = Storage()
        sut = StorageActionHandler(storage: storage)
        let action = SaveAction()
        let expectedState = makeAppState()
        handle(action, getState: { expectedState })
        XCTAssertEqual(storage.storedAppState, expectedState)
    }
    
    func test_handleAction_whereActionIsSaveAction_doesNotLoadAppState() {
        let storage = Storage()
        storage.stub = makeAppState()
        sut = StorageActionHandler(storage: storage)
        let action = SaveAction()
        var capturedState: AppState?
        handle(action, setState: { capturedState = $0 })
        XCTAssertNil(capturedState)
    }
    
    func test_handleAction_whereActionIsLoadAction_doesNotSaveAppState() {
        let storage = Storage()
        sut = StorageActionHandler(storage: storage)
        handle(LoadAction())
        XCTAssertNil(storage.storedAppState)
    }
    
    func test_handleAction_whereActionIsOfWrongType_doesNotLoadNorSaveAppState() {
        let storage = Storage()
        sut = StorageActionHandler(storage: storage)
        var capturedState: AppState?
        handle(Action(), setState: { capturedState = $0 })
        XCTAssertNil(storage.storedAppState)
        XCTAssertNil(capturedState)
    }
}

private struct Action: Core.Action {}

private class Storage: Core.Storage {
    
    var stub: AppState = makeAppState()
    
    func loadAppState() -> AppState { stub }
    
    var storedAppState: AppState?
    
    func store(appState: AppState) {
        storedAppState = appState
    }
}

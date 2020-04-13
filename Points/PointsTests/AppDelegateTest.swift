//
//  Created by Peter Combee on 13/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import XCTest
@testable import Points

class AppDelegateTest: XCTestCase {
    
    private var sut: AppDelegate!
    private var appStore: AppStore!
    
    override func setUp() {
        sut = AppDelegate()
        appStore = AppStore()
        sut.appStore = appStore
    }
    
    func test_didFinishLaunchingWithOptions_dispatchesLoadAction() {
        _ = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        XCTAssertTrue(appStore.capturedAction is LoadAction)
    }
    
    func test_applicationWillTerminate_dispatchesSaveAction() {
        sut.applicationWillTerminate(UIApplication.shared)
        XCTAssertTrue(appStore.capturedAction is SaveAction)
    }
}

import Core

class AppStore: Points.AppStore {
    
    var capturedAction: Action?
    
    func dispatch(_ action: Action) {
        capturedAction = action
    }
}

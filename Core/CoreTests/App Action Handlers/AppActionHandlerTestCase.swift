//
//  Created by Peter Combee on 12/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

@testable import Core

protocol AppActionHandlerTestCase {
    associatedtype Handler: AppActionHandler
    var sut: Handler! { get }
}

extension AppActionHandlerTestCase {
    func handle(
        _ action: Action,
        getState: () -> AppState = { makeAppState() },
        setState: @escaping (AppState) -> Void,
        dispatch: @escaping (Action) -> Void = {_ in}
    ) {
        sut.handle(action, getState: getState, setState: setState, dispatch: dispatch)
    }
}

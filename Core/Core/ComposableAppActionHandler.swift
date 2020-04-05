//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

class AppState {}

protocol AppActionHandler {
    func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void)
}

struct ComposableAppActionHandler: ActionHandler {
    
    let handlers: [AppActionHandler]
    
    func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void) {
        handlers.forEach {
            $0.handle(action, getState: getState, setState: setState, dispatch: dispatch)
        }
    }
}

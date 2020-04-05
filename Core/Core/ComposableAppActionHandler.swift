//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

struct AppState {}

protocol AppActionHandler {
    func handle(_ action: Action, getState: () -> AppState, setState: (AppState) -> Void, dispatch: (Action) -> Void)
}

struct ComposableAppActionHandler: ActionHandler {
    
    let handlers: [AppActionHandler]
    
    func handle(_ action: Action, getState: () -> AppState, setState: (AppState) -> Void, dispatch: (Action) -> Void) {
        handlers.forEach {
            $0.handle(action, getState: { AppState() }, setState: {_ in}, dispatch: {_ in})
        }
    }
}

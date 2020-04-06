//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

struct NewGameAction: Action {
    
}

struct GameActionHandler: AppActionHandler {
    func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void) {
        var state = getState()
        state.games.append(Game())
        setState(state)
    }
}

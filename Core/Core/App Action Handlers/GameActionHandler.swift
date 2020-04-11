//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//


import Foundation

struct NewGameAction: Action {}
struct DeleteGameAction: Action, Equatable {
    let indexSet: IndexSet
}

struct GameActionHandler: AppActionHandler {
    func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void) {
        switch action {
        case is NewGameAction:
            var state = getState()
            state.games.append(Game())
            setState(state)
        case let action as DeleteGameAction:
            var state = getState()
            state.games.remove(atOffsets: action.indexSet)
            setState(state)
        default: return
        }
    }
}


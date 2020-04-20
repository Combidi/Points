//
//  Created by Peter Combee on 12/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

struct AddPlayerAction: Action, Equatable {
    let name: String
}

struct PlayerActionHandler: AppActionHandler {
    
    func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void) {
        guard let action = action as? AddPlayerAction else { return }
        var state = getState()
        state.players.append(Player(name: action.name))
        setState(state)
    }
}

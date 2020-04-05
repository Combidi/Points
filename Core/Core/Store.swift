//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

public protocol ActionHandler {
    associatedtype State
    func handle(_ action: Action, getState: () -> State, setState: (State) -> Void, dispatch: (Action) -> Void)
}

public class Store<Handler: ActionHandler> {
    
    private(set) var state: Handler.State
    
    let actionHandler: Handler
    
    public init(state: Handler.State, actionHandler: Handler) {
        self.state = state
        self.actionHandler = actionHandler
    }

    public func dispatch(_ action: Action) {
        actionHandler.handle(action, getState: { state }, setState: { state = $0 }, dispatch: dispatch)
    }
}

public protocol Action {}

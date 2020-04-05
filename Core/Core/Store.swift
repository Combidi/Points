//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

public protocol ActionHandler {
    associatedtype StateType
    func handle(_ action: Action, getState: () -> StateType, setState: @escaping (StateType) -> Void, dispatch: @escaping (Action) -> Void)
}

public class Store<StateType, ActionHandlerType: ActionHandler> where ActionHandlerType.StateType == StateType {
    
    private(set) var state: StateType
    
    let actionHandler: ActionHandlerType
    
    public init(state: StateType, actionHandler: ActionHandlerType) {
        self.state = state
        self.actionHandler = actionHandler
    }

    public func dispatch(_ action: Action) {
        actionHandler.handle(action, getState: { state }, setState: { self.state = $0 }, dispatch: dispatch)
    }
}

public protocol Action {}

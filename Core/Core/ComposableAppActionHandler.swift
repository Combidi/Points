//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

public struct AppState: Equatable, Codable {
    
    public static func empty() -> AppState { .init() }
    
    var games: [Game] = []
    var players: [Player] = []
}

protocol AppActionHandler {
    func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void)
}

public struct ComposableAppActionHandler: ActionHandler {
    
    let handlers: [AppActionHandler]
    
    public func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void) {
        handlers.forEach {
            $0.handle(action, getState: getState, setState: setState, dispatch: dispatch)
        }
    }
}

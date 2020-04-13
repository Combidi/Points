//
//  Created by Peter Combee on 13/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Foundation

public protocol Storage {
    func loadAppState() -> AppState
    func store(appState: AppState)
}

struct LoadAction: Action {}
struct SaveAction: Action {}

struct StorageActionHandler: AppActionHandler {
    
    let storage: Storage
    
    func handle(_ action: Action, getState: () -> AppState, setState: @escaping (AppState) -> Void, dispatch: @escaping (Action) -> Void) {
        switch action {
        case _ as SaveAction:
            storage.store(appState: getState())
        case _ as LoadAction:
            setState(storage.loadAppState())
        default:
            return
        }
    }
}

//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

public func makeAppStore(storage: Storage) -> AppStore {
    AppStore(
        state: AppState(),
        actionHandler: ComposableAppActionHandler(handlers: [
            GameActionHandler(),
            PlayerActionHandler(),
            StorageActionHandler(storage: storage)
        ])
    )
}

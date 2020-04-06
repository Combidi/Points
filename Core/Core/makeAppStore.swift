//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

public func makeAppStore() -> AppStore {
    AppStore(state: AppState(), actionHandler: ComposableAppActionHandler(handlers: [GameActionHandler()]))
}

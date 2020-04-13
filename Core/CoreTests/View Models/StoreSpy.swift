//
//  Created by Peter Combee on 12/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

@testable import Core

class StoreSpy: Store<AppState, ComposableAppActionHandler> {
    
    init() {
        super.init(state: makeAppState(), actionHandler: ComposableAppActionHandler(handlers: []))
    }
    
    var capturedAction: Action?
    
    override func dispatch(_ action: Action) {
        capturedAction = action
    }
}

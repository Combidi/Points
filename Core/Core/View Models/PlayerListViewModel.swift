//
//  Created by Peter Combee on 12/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Combine

class PlayerListViewModel {
    
    private var subscriptions = Set<AnyCancellable>()
    
    let store: AppStore
    
    public init(store: AppStore) {
        self.store = store
        store.$state
            .map(\.players)
            .assign(to: \.players, on: self)
            .store(in: &subscriptions)
    }
    
    @Published public var players: [Player] = []
}

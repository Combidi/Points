//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Combine

public class GameListViewModel {
    
    private var subscriptions = Set<AnyCancellable>()
    
    let store: AppStore
    
    public init(store: AppStore) {
        self.store = store
        store.$state
            .map(\.games)
            .assign(to: \.games, on: self)
            .store(in: &subscriptions)
    }
    
    @Published public var games: [Game] = []
}

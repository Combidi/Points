//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Foundation

public struct Game: Equatable, Identifiable {
    
    public let id = UUID()
    
    public init() {}
}

import Combine

public typealias AppStore = Store<AppState, ComposableAppActionHandler>

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

//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Combine
import SwiftUI

public class GameListViewModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    
    let store: AppStore
    
    public init(store: AppStore) {
        self.store = store
        addGame = {
            store.dispatch(NewGameAction())
        }
        store.$state
            .map(\.games)
            .assign(to: \.games, on: self)
            .store(in: &subscriptions)
    }
    
    public let addGame: () -> Void
    
    public func deleteGames(in indexSet: IndexSet) {
        store.dispatch(DeleteGameAction(indexSet: indexSet))
    }
    
    @Published public var games: [Game] = []
}

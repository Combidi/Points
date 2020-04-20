//
//  Created by Peter Combee on 12/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Combine
import Foundation

public class ViewModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
        
    public init(store: AppStore) {
        addPlayer = {
            store.dispatch(AddPlayerAction(name: $0))
        }
        deleteGames = {
            store.dispatch(DeleteGameAction(indexSet: $0))
        }
        addGame = {
            store.dispatch(NewGameAction(for: $0))
        }
        store.$state
            .map(\.players)
            .assign(to: \.players, on: self)
            .store(in: &subscriptions)
        store.$state
            .map(\.games)
            .assign(to: \.games, on: self)
            .store(in: &subscriptions)
    }
    
    @Published public var players: [Player] = []
    @Published public var games: [Game] = []

    public typealias Name = String
    
    public let addPlayer: (Name) -> Void
    public let deleteGames: (IndexSet) -> Void
    public let addGame: (Set<Player>) -> Void

}

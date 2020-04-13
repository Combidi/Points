//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Foundation

public struct Game: Equatable, Identifiable {
    
    public let entries: [Entry]
    
    public init(entries: [Entry] = []) {
        self.entries = entries
    }

    public let id = UUID()
    
    public var players: Set<Player> {
        Set(entries.map { $0.player })
    }
}

public struct Entry: Equatable {
    
    public let player: Player
    public let score: Int

    public init(player: Player, score: Int) {
        self.player = player
        self.score = score
    }
}

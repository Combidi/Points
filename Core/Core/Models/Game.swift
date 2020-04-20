//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Foundation

public struct Game: Equatable, Identifiable, Codable {
    
    public let entries: [Entry]
    public let players: Set<Player>
    
    public init(entries: [Entry] = [], players: Set<Player>) {
        self.entries = entries
        self.players = players
    }

    public let id = UUID()    
}

public struct Entry: Equatable, Codable {
    
    public let player: Player
    public let score: Int

    public init(player: Player, score: Int) {
        self.player = player
        self.score = score
    }
}

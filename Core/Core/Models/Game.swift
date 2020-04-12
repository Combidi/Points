//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Foundation

public struct Game: Equatable, Identifiable {
    
    public let id = UUID()
    public let entries: [Entry]
    
    public init(entries: [Entry] = []) {
        self.entries = entries
    }
    
    public var players: [String] {
        Array(Set(entries.map { $0.player }))
    }
}

public struct Entry: Equatable {
    
    let player: String
    let score: Int

}

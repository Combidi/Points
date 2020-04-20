//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

@testable import Core

func makeGame() -> Game { Game(entries: [], players: []) }
func makePlayer() -> Player { Player(name: .random()) }
func makeAppState(
    games: [Game] = .init(repeating: makeGame(), count: 2),
    players: [Player] = .init(repeating: makePlayer(), count: 2)
) -> AppState {
    AppState(games: games, players: players)
    
}

extension String {
    static func random(length: Int = 5) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

//
//  Created by Peter Combee on 11/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import SwiftUI
import Core

struct GameDetails: View {
    
    let game: Game
    
    var body: some View {
        VStack {
            ScrollView {
                HStack(spacing: 0) {
                    ForEach(game.sortedPlayers) { player in
                        ZStack {
                            Color.clear
                            Text(player.name)
                        }
                    }
                }
            }
            ColorButton(title: "End game", action: {}, color: .red)
        }
        .navigationBarTitle(game.id.uuidString)
        .navigationBarItems(trailing: Button(action: {}) { Text("New Entry") })
    }
}

struct GameDetails_Previews: PreviewProvider {
    static var previews: some View {
        
        let players = [
            Player(name: "Peter"),
            Player(name: "Anke"),
            Player(name: "Stoffers")
        ]
        
        return NavigationView {
            GameDetails(game: .init(
                entries: [
                    .init(player: players[0], score: 30),
                    .init(player: players[1], score: 10),
                    .init(player: players[2], score: 40)
                ],
                players: Set(players)
            ))
        }
    }
}

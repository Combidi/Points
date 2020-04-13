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
            Button(action: {}) {
                Text("End game")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }
        }
        .navigationBarTitle(game.id.uuidString)
        .navigationBarItems(trailing: Button(action: {}) { Text("New Entry") })
    }
}

struct GameDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameDetails(game: .init(entries: [
                .init(player: .init(name: "Peter"), score: 30),
                .init(player: .init(name: "Anke"), score: 10),
                .init(player: .init(name: "Stoffers"), score: 40)
            ]))
        }
    }
}

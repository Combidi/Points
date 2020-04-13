//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import SwiftUI
import Core

struct GameList: View {
        
    @ObservedObject private var model = GameListViewModel(store: appStore)
        
    @State private var playerSelectionPresented = false
    
    var body: some View {
        List {
            ForEach(model.games) { game in
                NavigationLink(destination: GameDetails(game: game)) {
                    Text("Game")
                }
            }
            .onDelete(perform: model.deleteGames(in:))
        }
        .navigationBarTitle("Games")
        .navigationBarItems(
            trailing: Button(action: { self.playerSelectionPresented = true }) { Text("New game") }
        )
        .sheet(isPresented: $playerSelectionPresented) {
            NavigationView {
                PlayerList()
                    .navigationBarItems(
                        trailing: Button(action: self.model.addGame) { Text("Save") }
                )
            }
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameList()
        }
    }
}

//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import SwiftUI
import Core

struct GameList: View {
        
    @ObservedObject var model = GameListViewModel(store: appStore)
        
    var body: some View {
        NavigationView {
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
                trailing: Button(action: self.model.addGame) { Text("New game") }
            )
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
    }
}

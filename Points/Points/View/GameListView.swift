//
//  Created by Peter Combee on 19/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import SwiftUI
import Core

struct GameListView: View {

    @ObservedObject private var model = ViewModel(store: appStore)
    
    @State private var playerSelectionPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.games) { game in
                    NavigationLink(destination: GameDetails(game: game)) {
                        Text("Game")
                    }
                }
                .onDelete(perform: model.deleteGames)
            }
            .navigationBarItems(trailing: Button(action: { self.playerSelectionPresented = true } ) { Text("New game") })
            .navigationBarTitle("Games")
            .sheet(isPresented: $playerSelectionPresented) {
                PlayerSelectionView()
            }            
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}

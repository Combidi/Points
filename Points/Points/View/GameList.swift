//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import SwiftUI
import Core

struct GameList: View {
        
    @ObservedObject var model = GameListViewModel(store: appStore)
    
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.games) { game in
                    Text("game")
                }
                .onDelete(perform: model.deleteGames(in:))
            }
            .navigationBarTitle("Games")
            .environment(\.editMode, $editMode)
            .navigationBarItems(
                leading: EditButton(),
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

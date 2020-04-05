//
//  Created by Peter Combee on 05/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import SwiftUI
import Core

struct GameList: View {
        
    let model = GameListViewModel(store: appStore)
    
    var body: some View {
        NavigationView {
            List(model.games) { game in
                Text("game")
            }
            .navigationBarTitle("Games")
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
    }
}

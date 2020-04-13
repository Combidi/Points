//
//  Created by Peter Combee on 12/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import SwiftUI
import Core

struct PlayerList: View {
    
    @ObservedObject var model = PlayerListViewModel(store: appStore)
    
    var body: some View {
        List(model.players) { player in
            Text(player.name)
        }
        .navigationBarTitle("Players")
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList()
    }
}

//
//  Created by Peter Combee on 19/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import SwiftUI
import Core

struct PlayerSelectionView: View {
    
    @ObservedObject private var model = ViewModel(store: appStore)
        
    @State private var addPlayerFormPresented = false
    @State private var selectedPlayers: Set<Player> = []
    
    var body: some View {
        NavigationView {
            VStack {
                List(model.players) { player in
                    ZStack {
                        
                        Button(action: {
                            if self.selectedPlayers.contains(player) {
                                self.selectedPlayers.remove(player)
                            } else {
                                self.selectedPlayers.insert(player)
                            }
                        }) {
                            HStack {
                                Text(player.name)
                                Spacer()
                                if self.selectedPlayers.contains(player) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                }
                            }
                        }
                    }
                }
                ColorButton(title: "Confirm", action: self.addGame, color: .green)
            }
            .navigationBarTitle("Players")
            .navigationBarItems(trailing: Button(action: { self.addPlayerFormPresented = true }) { Text("Add player")})
            .sheet(isPresented: $addPlayerFormPresented) {
                PlayerForm(presented: self.$addPlayerFormPresented)
            }
        }
    }
    
    private func addGame() {
        model.addGame(selectedPlayers)
        addPlayerFormPresented = false
    }
}

struct PlayerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSelectionView()
    }
}

//
//  Created by Peter Combee on 19/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import SwiftUI
import Core

struct PlayerForm: View {
    
    @ObservedObject var model = ViewModel(store: appStore)
    @Binding var presented: Bool

    @State private var playerNameInput: String = ""
    
    var body: some View {
        VStack {
            TextField("Player name", text: self.$playerNameInput)
                .padding()
                .frame(height: 50)
            ColorButton(
                title: "Confirm",
                action: {
                    self.model.addPlayer(self.playerNameInput)
                    self.presented = false
                },
                color: .green
            )
        }
    }
}

struct PlayerForm_Previews: PreviewProvider {
    static var previews: some View {
        PlayerForm(model: .init(store: appStore), presented: .constant(false))
    }
}

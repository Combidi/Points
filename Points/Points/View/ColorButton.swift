//
//  Created by Peter Combee on 19/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import SwiftUI

struct ColorButton: View {
    
    let title: String
    let action: () -> Void
    let color: Color
    
    var body: some View {
        ZStack {
            color
            Button(action: action) {
                Text(title)
                    .foregroundColor(.white)
            }
        }
        .frame(height: 60)
        .cornerRadius(10)
        .padding()
    }
}

struct ColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorButton(title: "Confirm", action: {}, color: .green)
    }
}

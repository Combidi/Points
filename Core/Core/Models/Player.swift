//
//  Created by Peter Combee on 12/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Foundation

public struct Player: Equatable, Identifiable, Hashable {
    
    public let name: String

    public init(name: String) {
        self.name = name
    }
    
    public let id = UUID()
}

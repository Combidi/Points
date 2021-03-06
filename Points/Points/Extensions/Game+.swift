//
//  Created by Peter Combee on 13/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Core

extension Game {
    var sortedPlayers: [Player] {
        Array(players).sorted(by: { $0.name < $1.name })
    }
}

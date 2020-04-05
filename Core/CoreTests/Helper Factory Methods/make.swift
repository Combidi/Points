//
//  Created by Peter Combee on 06/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

@testable import Core

func makeGame() -> Game { Game()}
func makeAppState() -> AppState { AppState(games: [makeGame(), makeGame()]) }

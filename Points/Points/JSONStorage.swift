//
//  Created by Peter Combee on 13/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Foundation

private func loadAppStateFromJSON() -> AppState {
   let path = Bundle.main.path(forResource: "data", ofType: "json")!
   let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
   let appState = try! JSONDecoder().decode(AppState.self, from: data)
   return appState
}

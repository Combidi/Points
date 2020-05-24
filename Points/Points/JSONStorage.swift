//
//  Created by Peter Combee on 13/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Core
import Foundation

struct JSONStorage: Storage {
    
    func loadAppState() -> AppState {
        
        guard let dirUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError()
        }
        let fileUrl = dirUrl.appendingPathComponent("state.json")
        
        do {
            let data = try Data(contentsOf: fileUrl)
            let appState = try JSONDecoder().decode(AppState.self, from: data)
            return appState
        } catch {
            print(error)
            return .empty()
        }
    }
    
    func save(appState: AppState) {
        guard let dirUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        let fileUrl = dirUrl.appendingPathComponent("state.json")
        
        do {
            let data = try JSONEncoder().encode(appState)
            try data.write(to: fileUrl)
        } catch {
            print(error)
        }
    }
}

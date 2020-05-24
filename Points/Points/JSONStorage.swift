//
//  Created by Peter Combee on 13/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Core
import Foundation

struct JSONStorage: Storage {
    
    private var fileUrl: URL? {
        guard let dirUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return dirUrl.appendingPathComponent("state.json")
    }
    
    func loadAppState() -> AppState {

        guard let fileUrl = fileUrl else { return .empty() }
        
        do {
            return try JSONDecoder().decode(AppState.self, from: .init(contentsOf: fileUrl))
        } catch {
            print(error)
            return .empty()
        }
    }
    
    func save(appState: AppState) {
        
        guard let fileUrl = fileUrl else { return }
        
        do {
            try JSONEncoder().encode(appState).write(to: fileUrl)
        } catch {
            print(error)
        }
    }
}

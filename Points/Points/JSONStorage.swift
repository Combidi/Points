//
//  Created by Peter Combee on 13/04/2020.
//  Copyright © 2020 Combidi. All rights reserved.
//

import Core

struct JSONStorage: Storage {

    private let path = Bundle.main.path(forResource: "state", ofType: "json")!

    func loadAppState() -> AppState {        
        let attributes = try! FileManager.default.attributesOfItem(atPath: path)
        if attributes[.size] as! UInt == 0 {
            return AppState.empty()
        } else {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let appState = try! JSONDecoder().decode(AppState.self, from: data)
            return appState
        }
    }
    
    func save(appState: AppState) {
        let json = try! JSONEncoder().encode(appState)
        let fileHandler = FileHandle(forWritingAtPath: path)!
        fileHandler.write(json)
        fileHandler.closeFile()
    }
}

import Foundation


//
//  Sync.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

class Sync {
    
    weak var notification: Synchronizer?
    
    init(notify: Synchronizer) {
        self.notification = notify
    }
}


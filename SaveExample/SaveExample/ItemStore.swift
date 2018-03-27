//
//  ItemStore.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

class ItemStore: Store {

    var notifications: [Sync] = []
    
    typealias Model = Item
    
    var values: [Item] = []
    
    var database: Database<Data>
    
    init(database: Database<Data>) {
        self.database = database
    }
    
    func value(for key: String) -> Item? {
        return values.filter { $0.name == key }.first
    }
}

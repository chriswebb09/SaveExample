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
    
    var database: Database<Data> = Database<Data>(key: UUID().uuidString, encoder: JSONEncoder.init(), decoder: JSONDecoder.init())
    
}

//
//  Item.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

class Item: Hashable, Codable {
    
    var hashValue: Int {
        return uuid.hashValue
    }
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    var identity: UUID {
        return uuid
    }
    
    let uuid: UUID
    
    private(set) var name: String
    
    init(name: String, uuid: UUID) {
        self.name = name
        self.uuid = uuid
    }
    
    enum Keys: CodingKey { case name, uuid }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.uuid = try container.decode(UUID.self, forKey: .uuid)
        self.name = try container.decode(String.self, forKey: .name)
 
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(name, forKey: .name)
        try container.encode(uuid, forKey: .uuid)
    }
    
    func set(_ newName: String) {
        name = newName
    }
}


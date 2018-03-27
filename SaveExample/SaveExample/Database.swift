//
//  Database.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

class Database<T: Codable>: DataWriter, DataReader {
    
    var decoder: JSONDecoder
    var encoder: JSONEncoder
    var key: String
    
    var defaults: UserDefaults = .standard
    
    init(key: String, encoder: JSONEncoder, decoder: JSONDecoder) {
        self.key = key
        self.encoder = encoder
        self.decoder = decoder
    }
    
    convenience init(key: String) {
        self.init(key: key, encoder: JSONEncoder.init(), decoder: JSONDecoder.init())
    }
    
    convenience init() {
        self.init(key: UUID().uuidString, encoder: JSONEncoder.init(), decoder: JSONDecoder.init())
    }
    
    func write(value: T) {
        defaults.set(value, forKey: key)
    }
    
    func read() -> T? {
        return nil
    }
}

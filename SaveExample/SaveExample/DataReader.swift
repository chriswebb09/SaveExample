//
//  DataReader.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

protocol DataReader: class {
    associatedtype T: Codable
    var decoder: JSONDecoder { get }
    var defaults: UserDefaults { get }
    var key: String { get }
    func read() -> T?
}


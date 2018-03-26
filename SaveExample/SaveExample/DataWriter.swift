//
//  DataWriter.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

protocol DataWriter: class {
    associatedtype T: Codable
    var encoder: JSONEncoder { get }
    var defaults: UserDefaults { get }
    var key: String { get }
    func write(value: T)
}

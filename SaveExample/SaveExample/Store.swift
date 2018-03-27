//
//  Store.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

protocol Store: class {
    
    associatedtype Model: Codable, Equatable
    
    var notifications: [Sync] { get set }
    
    var values: [Model] { get set }
    
    var database: Database<Data> { get }
}

extension Store {
    
    func add(_ value: Model) {
        guard !values.contains(value) else { return }
        values.insert(value, at: 0)
        save()
    }
    
    func remove(_ value: Model) {
        guard let offset = values.index(of: value) else { return }
        let index = values.startIndex.distance(to: offset)
        values.remove(at: index)
        save()
    }
    
    func clear() {
        values.removeAll()
        save()
    }
    
    func contains(_ value: Model) -> Bool {
        return values.contains(value)
    }

    func add(listener: Synchronizer) {
        let wrapper = Sync(notify: listener)
        notifications.append(wrapper)
    }
    
    func save() {
        guard let data = try? database.encoder.encode(values) else { return }
        notifications.forEach { $0.notification?.willUpdate() }
        database.write(value: data)
        notifications.forEach { $0.notification?.didUpdate() }
    }
}

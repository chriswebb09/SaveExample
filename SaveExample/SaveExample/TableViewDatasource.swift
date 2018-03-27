//
//  TableViewDatasource.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject {
    
    var store: ItemStore!
    
    var cellModels: [CellModel] {
        return self.store.values.map { CellModel(title: $0.name) }
    }
    
    init(store: ItemStore) {
        self.store = store
    }
    
    var itemCount: Int {
        return cellModels.count
    }
    
    func updateItem() {
        store.add(Item(name: "Item \(itemCount + 1)", uuid: UUID.init()))
    }
    
    func clearAll() {
        store.clear()
    }
    
    func cellModel(for indexPath: IndexPath) -> CellModel {
        return cellModels[indexPath.row]
    }
    
    func getItem(from model: CellModel) -> Item? {
        guard let text = model.titleText else { return nil }
        if let value = store.value(for: text) {
            return value
        }
        return nil
    }
    
    func remove(value: Item?) {
        if let item = value {
            store.remove(item)
        }
    }
    
    func removeValue(for indexPath: IndexPath) {
        let model = cellModel(for: indexPath)
        let item = getItem(from: model)
        remove(value: item)
    }
}

extension TableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "example", for: indexPath) as UITableViewCell
        cell.textLabel?.text = cellModels[indexPath.row].titleText
        return cell
    }
}

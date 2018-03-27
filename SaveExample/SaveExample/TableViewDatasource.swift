//
//  TableViewDatasource.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject {
    
    private var store: ItemStore
    
    private var cellModels: [CellModel] {
        return self.store.values.map { CellModel(title: $0.name) }
    }
    
    private var itemCount: Int {
        return cellModels.count
    }
    
    init(store: ItemStore) {
        self.store = store
    }
    
    func updateItem() {
        addItem(item: Item(name: "Item \(itemCount + 1)", uuid: UUID.init()))
    }
    
    func addItem(item: Item) {
        store.add(item)
    }
    
    func clearAll() {
        store.clear()
    }
    
    func getItem(from model: CellModel) -> Item? {
        guard let text = model.titleText, let value = store.value(for: text) else { return nil }
        return value
    }
    
    func remove(value: Item?) {
        if let item = value {
            store.remove(item)
        }
    }
    
    func removeValue(for indexPath: IndexPath) {
        let model = cellModels[indexPath.row]
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

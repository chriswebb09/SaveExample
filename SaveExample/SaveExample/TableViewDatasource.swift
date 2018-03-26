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

    init(store: ItemStore) {
        self.store = store
    }

    var itemCount: Int {
        return store.values.count
    }
 
    func updateItem() {
        store.values.append(Item(name: "Item \(itemCount + 1)", uuid: UUID.init()))
        store.save()
    }
}

extension TableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "example", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = store.values[indexPath.row].name
        return cell
    }
    
    
}

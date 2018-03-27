//
//  ViewController.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource: TableViewDataSource!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            setup()
        }
    }
    
    @IBAction func saveItem(_ sender: Any) {
        dataSource.updateItem()
    }
    
    @IBAction func clearItems(_ sender: Any) {
        dataSource.clearAll()
    }
    
    func setup() {
        let database = Database<Data>()
        let store = ItemStore(database: database)
        store.add(listener: self)
        self.dataSource = TableViewDataSource(store: store)
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
}

extension ViewController: Synchronizer {
    
    func didUpdate() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func willUpdate() {
        print("about to reload tableView")
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dataSource.removeValue(for: indexPath)
    }
}


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
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            setup()
        }
    }

    @IBAction func saveItem(_ sender: Any) {
        dataSource.updateItem()
    }
    
    func setup() {
        let store = ItemStore(database: Database<Data>(key: UUID().uuidString, encoder: JSONEncoder.init(), decoder: JSONDecoder.init()))
        store.add(listener: self)
        self.dataSource = TableViewDataSource(store: store)
        tableView.dataSource = dataSource
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


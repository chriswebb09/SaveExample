//
//  CellModel.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class CellModel: NSObject {
    @objc dynamic var titleText: String? = ""
    
    init(title: String) {
        self.titleText = title
    }
}

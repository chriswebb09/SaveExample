//
//  Synchronizer.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

protocol Synchronizer: class {
    func willUpdate()
    func didUpdate()
}

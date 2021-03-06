//
//  Extensions.swift
//  Scatter and Gather Animations
//
//  Created by Alex on 5/15/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation

extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

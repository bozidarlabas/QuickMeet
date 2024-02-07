//
//  Array+Sage.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import Foundation

extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}


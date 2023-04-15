//
//  BMIDataContent.swift
//  Fi2
//
//  Created by Joseph William Santoso on 15/04/23.
//

import Foundation

struct BMIResult: Identifiable, Hashable {
    var id: String?
    var height: Double
    var weight: Double
    var result: Double
    
    func toDictionary() -> [String: Any] {
        return [
            "height": height,
            "weight": weight,
            "result": result
        ]
    }
}

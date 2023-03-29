//
//  GifImageContent.swift
//  Fi2
//
//  Created by Joseph William Santoso on 29/03/23.
//

import Foundation

enum URLType {
    case name(String)
    case url(URL)
    
    var url: URL? {
        switch self {
        case .name(let name):
            return Bundle.main.url(forResource: name, withExtension: "gif")
        case .url(let remoteURL):
            return remoteURL
        }
    }
}

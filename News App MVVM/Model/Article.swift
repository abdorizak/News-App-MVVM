//
//  Article.swift
//  News App MVVM
//
//  Created by Abdirizak Hassan on 1/6/23.
//

import Foundation

// MARK: - Article
struct Article: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Articles]
}

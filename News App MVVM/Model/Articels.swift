//
//  Articels.swift
//  News App MVVM
//
//  Created by Abdirizak Hassan on 1/6/23.
//

import Foundation

// MARK: - Articles
struct Articles: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

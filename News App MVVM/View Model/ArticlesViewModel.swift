//
//  ArticlesViewModel.swift
//  News App MVVM
//
//  Created by Abdirizak Hassan on 1/6/23.
//

import Foundation


struct ArticleListViewModel {
    let article: Article
    
    var numberofSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        self.article.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = article.articles[index]
        return ArticleViewModel(article)
    }
    
}

struct ArticleViewModel {
    
    private let articles: Articles
    
    init(_ article: Articles) {
        self.articles = article
    }
    
    var title: String {
        articles.title ?? "N/A"
    }
    
    var description: String {
        articles.description ?? "N/A"
    }
    
    var url_content: String {
        articles.url ?? "N/A"
    }
    
    var image_url: String {
        articles.urlToImage ?? "N/A"
    }
}

//
//  NewsCollectionViewCell.swift
//  News App MVVM
//
//  Created by Abdirizak Hassan on 1/6/23.
//

import Foundation
import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    static let idetifier = String(describing: NewsCollectionViewCell.self)
    
    private let newsImage = Image(mode: .scaleAspectFill)
    private let newstitle = Lable(Title: .center, fontSize: 22)
    private let newsdescription = Lable(SecondaryTitle: UIColor.gray.withAlphaComponent(0.7), fontsize: 14, weight: .regular)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubViews(newsImage, newstitle, newsdescription)
        newsImage.layer.cornerRadius = 12
        newsImage.layer.shadowColor = UIColor.white.cgColor
        newsImage.layer.shadowRadius = 20
        newsImage.layer.shadowOpacity = 0.4
        newsdescription.lineBreakMode = .byTruncatingTail
        newsdescription.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            newsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            newsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsImage.heightAnchor.constraint(equalToConstant: 220),
            
            
            newstitle.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8),
            newstitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            newstitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newstitle.heightAnchor.constraint(equalToConstant: 24),
            
            newsdescription.topAnchor.constraint(equalTo: newstitle.bottomAnchor, constant: 8),
            newsdescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            newsdescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            newsdescription.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func display(_ article: ArticleViewModel) {
        newsImage.downloadImage(fromURL: article.image_url)
        newstitle.text = article.title
        newsdescription.text = article.description
    }
    
}

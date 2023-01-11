//
//  Image.swift
//  News App MVVM
//
//  Created by Abdirizak Hassan on 1/6/23.
//

import UIKit

class Image: UIImageView {
    
    let placeHolderImage = Images.placeHolderImage
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        config()
    }
    
    convenience init(mode: UIView.ContentMode) {
        self.init(frame: .zero)
        contentMode = mode
    }
    
    convenience init(systemIcon: String, size: CGFloat = 14) {
        self.init(frame: .zero)
        image = UIImage(systemName: systemIcon, withConfiguration: UIImage.SymbolConfiguration(pointSize: size))
        tintColor = .secondaryLabel
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    private func config() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        image = placeHolderImage
    }
    
    func downloadImage(fromURL url: String) {
        Task { image = await NetworkManager.shared.downloadImage(from: url) ?? placeHolderImage }
    }
}

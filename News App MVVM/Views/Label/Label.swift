//
//  Label.swift
//  News App MVVM
//
//  Created by Abdirizak Hassan on 1/6/23.
//

import UIKit

class Lable: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /* Title Label */
    convenience init(Title textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        textColor                    = .label
        minimumScaleFactor           = 0.9
        lineBreakMode                = .byTruncatingTail
    }
    
    /* Secondary Title Lable */
    convenience init(SecondaryTitle titleTextColor: UIColor = .secondaryLabel, fontsize: CGFloat, weight: UIFont.Weight) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontsize, weight: weight)
        textColor                   = titleTextColor
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.90
        lineBreakMode               = .byTruncatingTail
    }
    
    /* Body Title Lable */
    convenience init(Body textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true // shrink a bit to try to fit into the label
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
    
    
    private func config() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor                                 = .secondaryLabel
        adjustsFontSizeToFitWidth                 = true
    }
    
    
}

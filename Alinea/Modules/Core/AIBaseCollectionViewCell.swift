//
//  AIBaseCollectionViewCell.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import UIKit

class AIBaseCollectionViewCell: UICollectionViewCell {    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupData() {
        
    }
}

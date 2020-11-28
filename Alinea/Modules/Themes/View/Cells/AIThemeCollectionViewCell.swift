//
//  AIThemeCollectionViewCell.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import UIKit

class AIThemeCollectionViewCell: AIBaseCollectionViewCell {
    
    let bgView: UIView = {
       let view = UIView()
        return view
    }()
    
    let labelView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let exploreImageview: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
            
        self.contentView.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        bgView.layer.cornerRadius = 8.0
        bgView.layer.borderWidth = 1.0
        bgView.layer.borderColor = AIColor.themeBorderBackgroundColor.cgColor
        bgView.layer.masksToBounds = true
        
        bgView.addSubview(exploreImageview)
        exploreImageview.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(-60)
        }
        
        bgView.addSubview(labelView)
        labelView.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(exploreImageview.snp.bottom)
        }
        
        labelView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(labelView)
            make.leading.equalTo(16)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupData(viewModel: AIThemesViewModel) {
        bgView.backgroundColor = viewModel.backgroundColor
        titleLabel.text = viewModel.title
        exploreImageview.image = FontAwesomeImageWrapper.getImage(name: viewModel.imagename, size: CGSize(width: 40, height: 40), color: .purple)
    }
}

//
//  UITrendingCollectionReusableView.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import UIKit

class AITrendingCollectionReusableView: UICollectionReusableView {
    let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let bgView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.02
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.height.equalTo(8)
            make.leading.trailing.top.equalToSuperview()
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(12)
            make.leading.equalTo(24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String) {
        titleLabel.text = title
    }
}

//
//  CategoryTableViewCell.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import UIKit
import SnapKit

class CategoryTableViewCell: AIBaseTableViewCell {
    
    let bgView: UIView = {
       let view = UIView()
        return view
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    let exploreImageview: UIImageView = {
        let imageview = UIImageView()
        
        return imageview
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        self.selectionStyle = .none
        self.contentView.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(80)
        }
        bgView.layer.cornerRadius = 40.0
        bgView.layer.masksToBounds = true
        
        bgView.addSubview(exploreImageview)
        exploreImageview.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 40, height: 40))
            make.leading.equalTo(40)
        }
        
        bgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(exploreImageview.snp.trailing).offset(20)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func setupData(viewModel: AIExploreViewModel) {
        bgView.backgroundColor = viewModel.backgroundColor
        titleLabel.text = viewModel.title
        exploreImageview.image = FontAwesomeImageWrapper.getImage(name: viewModel.imagename, size: CGSize(width: 40, height: 40), color: .white)
    }
}

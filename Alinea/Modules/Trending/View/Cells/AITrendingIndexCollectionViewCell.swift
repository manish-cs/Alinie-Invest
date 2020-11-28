//
//  AITrendingCollectionViewCell.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import UIKit

class AITrendingIndexCollectionViewCell: AIBaseCollectionViewCell {
    
    let bgView: UIView = {
       let view = UIView()
        view.backgroundColor = AIColor.greyColor
        view.alpha = 0.1
        return view
    }()

    let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let subTitleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let trendingImageview: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    let changeView: UIView = {
       let view = UIView()
        return view
    }()
    
    let rateChangeLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
            
        self.contentView.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        contentView.addSubview(trendingImageview)
        trendingImageview.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.size.equalTo(CGSize(width: 48, height: 48))
        }
                
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(trendingImageview).offset(-10)
            make.leading.equalTo(trendingImageview.snp.trailing).offset(16)
        }
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(0)
            make.leading.equalTo(trendingImageview.snp.trailing).offset(16)
        }
        
        contentView.addSubview(changeView)
        changeView.snp.makeConstraints { (make) in
            make.height.equalTo(24)
            make.width.equalTo(72)
            make.trailing.equalTo(-24)
            make.centerY.equalToSuperview()
        }
        changeView.layer.cornerRadius = 12.0
        changeView.layer.masksToBounds = true
        
        changeView.addSubview(rateChangeLabel)
        rateChangeLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.leading.equalTo(4)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupData(viewModel: AITrendingListViewModel) {
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subtitle
        trendingImageview.image = FontAwesomeImageWrapper.getImage(name: viewModel.imagename, size: CGSize(width: 48, height: 48), color: .orange)
        changeView.backgroundColor = (viewModel.type == .profit) ? AIColor.profitColor : AIColor.lossColor
        rateChangeLabel.text = ((viewModel.type == .profit) ? "+" : "-") + "\(viewModel.change)"
    }
}

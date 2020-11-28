//
//  AIExploreCollectionViewCell.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import UIKit
import SnapKit

class AITrendingCollectionViewCell: AIBaseCollectionViewCell {
    var presentor: AITrendingViewToPresenterProtocol?
    var categories = [AITrendingViewModel]()
    
    let collectionView: AIBaseCollectionView = {
        let collectionView: AIBaseCollectionView = AIBaseCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.contentInset = .zero
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        self.contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        collectionView.register(AITrendingIndexCollectionViewCell.self, forCellWithReuseIdentifier: "trendingCell")
        collectionView.register(AITrendingCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setupData() {
        categories = presentor?.fetchCategories() ?? []
    }
}

extension AITrendingCollectionViewCell: AITrendingPresenterToViewProtocol {
}

extension AITrendingCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories[section].list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trendingCell", for: indexPath) as! AITrendingIndexCollectionViewCell
        cell.setupData(viewModel: categories[indexPath.section].list[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! AITrendingCollectionReusableView
        header.setup(title: categories[indexPath.section].title)
        return header
    }
}

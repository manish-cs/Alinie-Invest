//
//  AIExploreCollectionViewCell.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import UIKit
import SnapKit

class AIThemesCollectionViewCell: AIBaseCollectionViewCell {
    var presentor: AIThemesViewToPresenterProtocol?
    var categories = [AIThemesViewModel]()
    
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
        collectionView.register(AIThemeCollectionViewCell.self, forCellWithReuseIdentifier: "themeCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setupData() {
        categories = presentor?.fetchCategories() ?? []
    }
}

extension AIThemesCollectionViewCell: AIThemesPresenterToViewProtocol {
}

extension AIThemesCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "themeCell", for: indexPath) as! AIThemeCollectionViewCell
        cell.setupData(viewModel: categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPerCell = ((collectionView.bounds.size.width - 24) / 2) - 24
        return CGSize(width:  widthPerCell, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
}

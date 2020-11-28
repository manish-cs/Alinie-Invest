//
//  AIExploreCollectionViewCell.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import UIKit
import SnapKit

class AIExploreCollectionViewCell: AIBaseCollectionViewCell {
    var presentor: AIExploreViewToPresenterProtocol?
    var categories = [AIExploreViewModel]()
    
    let tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.separatorStyle = .none
        return tableview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        self.contentView.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func setupData() {
        categories = presentor?.fetchCategories() ?? []
    }
}

extension AIExploreCollectionViewCell: AIExplorePresenterToViewProtocol {
}

extension AIExploreCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! AIBaseTableViewCell
        cell.setupData(viewModel: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
}

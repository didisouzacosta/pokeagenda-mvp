//
//  HomeListItemCellBuilder.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 30/01/21.
//

import Foundation
import UIKit

class HomeListItemCellBuilder {
    
    // MARK: - Public Properties
    
    var retryHandler: ((Int) -> Void)?
    
    // MARK: - Private Properties
    
    private let homeListItem: HomeListItem
    private let reuseIdentifier = HomeListItemViewCell.identifier
    
    // MARK: - Public Methods
    
    init(homeListItem: HomeListItem) {
        self.homeListItem = homeListItem
    }
    
}

extension HomeListItemCellBuilder: TableViewCellBuilder {
    
    func registerCell(in tableView: UITableView) {
        tableView.register(
            HomeListItemViewCell.nib,
            forCellReuseIdentifier: reuseIdentifier
        )
    }
    
    func tableViewCell(
        at indexPath: IndexPath,
        in tableView: UITableView
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as! HomeListItemViewCell
        
        cell.configure(with: homeListItem)
        cell.retryHandler = { [weak self] in
            self?.retryHandler?(indexPath.row)
        }
        
        return cell
    }
    
}

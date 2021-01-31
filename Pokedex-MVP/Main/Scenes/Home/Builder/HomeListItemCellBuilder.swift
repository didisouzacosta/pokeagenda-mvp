//
//  HomeListItemCellBuilder.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 30/01/21.
//

import Foundation
import UIKit

struct HomeListItemCellBuilder {
    
    // MARK: - Public Properties
    
    let homeListItem: HomeListItem
    
    // MARK: - Private Properties
    
    private let reuseIdentifier = HomeListItemViewCell.identifier
    
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
        
        cell.contentView.clipsToBounds = false
        cell.contentView.superview?.clipsToBounds = false
        
        cell.configure(with: homeListItem)
        
        return cell
    }
    
}

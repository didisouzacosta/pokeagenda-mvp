//
//  TableViewCellBuilder.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 30/01/21.
//

import UIKit

protocol TableViewCellBuilder {
    
    func registerCell(in tableView: UITableView)
    func tableViewCell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
    
}

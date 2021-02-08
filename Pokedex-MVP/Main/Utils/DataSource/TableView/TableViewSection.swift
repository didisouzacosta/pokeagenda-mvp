//
//  TableViewSection.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 30/01/21.
//

import Foundation
import UIKit

struct TableViewSection {
    
    var cellBuilders: [TableViewCellBuilder]
    var header: UIView?
    var footer: UIView?
    
}

extension TableViewSection {
    
    var numberOfRows: Int {
        return cellBuilders.count
    }
    
    func cell(
        at indexPath: IndexPath,
        on tableView: UITableView
    ) -> UITableViewCell {
        let row = cellBuilders[indexPath.row]
        return row.tableViewCell(at: indexPath, in: tableView)
    }
    
}

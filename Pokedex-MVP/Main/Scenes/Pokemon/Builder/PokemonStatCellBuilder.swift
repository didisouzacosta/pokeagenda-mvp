//
//  PokemonStatCellBuilder.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import Foundation
import UIKit

class PokemonStatCellBuilder {
    
    // MARK: - Private Properties
    
    private let stat: Stat
    private let reuseIdentifier = PokemonStatViewCell.identifier
    
    // MARK: - Public Methods
    
    init(_ stat: Stat) {
        self.stat = stat
    }
    
}

extension PokemonStatCellBuilder: TableViewCellBuilder {
    
    func registerCell(in tableView: UITableView) {
        tableView.register(
            PokemonStatViewCell.nib,
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
        ) as! PokemonStatViewCell
        
        cell.configure(with: stat)
        
        return cell
    }
    
}

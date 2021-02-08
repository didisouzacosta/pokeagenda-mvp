//
//  PokemonAbilityCellBuilder.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import Foundation
import UIKit

class PokemonAbilityCellBuilder {
    
    // MARK: - Public Properties
    
    var retryHandler: ((Int) -> Void)?
    
    // MARK: - Private Properties
    
    private let ability: String
    private let reuseIdentifier = PokemonAbilityViewCell.identifier
    
    // MARK: - Public Methods
    
    init(_ ability: String) {
        self.ability = ability
    }
    
}

extension PokemonAbilityCellBuilder: TableViewCellBuilder {
    
    func registerCell(in tableView: UITableView) {
        tableView.register(
            PokemonAbilityViewCell.nib,
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
        ) as! PokemonAbilityViewCell
        
        cell.configure(with: ability)
        
        return cell
    }
    
}

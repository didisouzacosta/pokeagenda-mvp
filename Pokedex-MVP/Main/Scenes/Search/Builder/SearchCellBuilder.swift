//
//  SearchCellBuilder.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

class SearchCellBuilder {
    
    // MARK: - Private Properties
    
    private let pokemon: PokemonViewModel
    private let reuseIdentifier = SearchViewCell.identifier
    
    // MARK: - Public Methods
    
    init(pokemon: PokemonViewModel) {
        self.pokemon = pokemon
    }
    
}

extension SearchCellBuilder: TableViewCellBuilder {
    
    func registerCell(in tableView: UITableView) {
        tableView.register(
            SearchViewCell.nib,
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
        ) as! SearchViewCell
        
        cell.configure(with: pokemon)
        
        return cell
    }
    
}

//
//  TableViewDataSource.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 30/01/21.
//

import Foundation
import UIKit

protocol TableViewDataSourceDelegate {
    func didSelect(rowAt indexPath: IndexPath)
    func willDisplay(rowAt indexPath: IndexPath)
    func prefetchRows(at indexPaths: [IndexPath])
    func didScroll(_ scrollView: UIScrollView)
    func onReachedTheEndOfTheScroll()
}

extension TableViewDataSourceDelegate {
    func willDisplay(rowAt indexPath: IndexPath) {}
    func prefetchRows(at indexPaths: [IndexPath]) {}
    func didScroll(_ scrollView: UIScrollView) {}
    func onReachedTheEndOfTheScroll() {}
}

final class TableViewDataSource: NSObject {
    
    // MARK: - Public Properties
    
    var delegate: TableViewDataSourceDelegate?
    var rowHeight = UITableView.automaticDimension
    var estimatedRowHeight: CGFloat = 140
    
    var sections: [TableViewSection] {
        didSet {
            registerCells()
            tableView?.reloadData()
        }
    }
    
    // MARK: - Private Properties
    
    private weak var tableView: UITableView?
    
    // MARK: - Public Methods
    
    init(
        sections: [TableViewSection],
        tableView: UITableView
    ) {
        self.sections = sections
        self.tableView = tableView
        
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.rowHeight = rowHeight
        tableView.estimatedRowHeight = estimatedRowHeight
        
        registerCells()
    }
    
    // MARK: - Private Methods
    
    private func registerCells() {
        guard let tableView = self.tableView else { return }
        
        sections
            .flatMap { $0.cellBuilders }
            .forEach { $0.registerCell(in: tableView) }
    }
}

extension TableViewDataSource: UITableViewDataSourcePrefetching {
    
    func tableView(
        _ tableView: UITableView,
        prefetchRowsAt indexPaths: [IndexPath]
    ) {
        delegate?.prefetchRows(at: indexPaths)
    }
    
}

extension TableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return sections[section].numberOfRows
    }
    
    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        cell.layer.zPosition = (CGFloat)(tableView.numberOfRows(inSection: 0) - indexPath.row)
        delegate?.willDisplay(rowAt: indexPath)
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let section = sections[indexPath.section]
        return section.cell(at: indexPath, on: tableView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.didScroll(scrollView)
        
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        
        if distanceFromBottom < height {
            delegate?.onReachedTheEndOfTheScroll()
        }
    }
    
}

extension TableViewDataSource: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelect(rowAt: indexPath)
    }
    
}

//
//  SearchInputView.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 01/02/21.
//

import Foundation
import UIKit

final class SearchInputView: UIView {
    
    // MARK: - Public Properties
    
    var placeholder: String? {
        didSet { textField.placeholder = placeholder }
    }
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var textField: UITextField!
    
    // MARK: - Public Methods
    
    init() {
        super.init(frame: .zero)
        Bundle.main.loadNibNamed("SearchInputView", owner: self, options: nil)
        pinning(containerView)
        setupIcon()
        setupContentView()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupTextField() {
        textField.font = Typography.description 
    }
    
    private func setupIcon() {
        iconImage.image = Assets.icon.search
        iconImage.tintColor = Colors.text.gray
    }
    
    private func setupContentView() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = Colors.background.defaultInput
    }
    
}

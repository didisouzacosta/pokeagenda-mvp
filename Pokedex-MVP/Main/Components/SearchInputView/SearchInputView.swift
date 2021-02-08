//
//  SearchInputView.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 01/02/21.
//

import Foundation
import UIKit

protocol SearchInputViewDelegate {
    func textDidChange(text: String?)
    func searchShouldBeginEditing() -> Bool
}

extension SearchInputViewDelegate {
    
    func textDidChange(text: String?) {}
    
    func searchShouldBeginEditing() -> Bool {
        return true
    }
    
}

final class SearchInputView: UIView {
    
    // MARK: - Public Properties
    
    var delegate: SearchInputViewDelegate?
    
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
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }
    
    @discardableResult
    override func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
    
    // MARK: - Private Methods
    
    private func setupTextField() {
        textField.font = Typography.description
        textField.delegate = self
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    private func setupIcon() {
        iconImage.image = Assets.icon.search
        iconImage.tintColor = Colors.text.gray
    }
    
    private func setupContentView() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = Colors.background.defaultInput
    }
    
    // MARK: Actions
    
    @IBAction private func textDidChange(textField: UITextField) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        perform(#selector(updateSearch(with:)), with: textField.text, afterDelay: 0.5)
    }
    
    @objc private func updateSearch(with text: String?) {
        delegate?.textDidChange(text: text)
    }
    
}

extension SearchInputView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        delegate?.searchShouldBeginEditing() ?? true
    }
    
}

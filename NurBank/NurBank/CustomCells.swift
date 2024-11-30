import UIKit

class InputCell: UITableViewCell, ConfigurableCell {
    typealias DataType = (label: String, value: String)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    var onValueChange: ((String) -> Void)?
    
    func configure(with data: DataType) {
        titleLabel.text = data.label
        valueTextField.text = data.value
        valueTextField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    @objc private func valueChanged() {
        onValueChange?(valueTextField.text ?? "")
    }
}

class ResultCell: UITableViewCell, ConfigurableCell {
    typealias DataType = String
    
    @IBOutlet weak var resultLabel: UILabel!
    
    func configure(with data: String) {
        resultLabel.text = data
    }
}


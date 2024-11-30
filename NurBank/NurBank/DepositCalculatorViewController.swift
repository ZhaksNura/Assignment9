import UIKit

class DepositCalculatorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = DepositViewModel()
    private var depositAmount: Double = 0.0
    private var interestRate: Double = 0.0
    private var term: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // Three input rows + one result row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell", for: indexPath) as! InputCell
            cell.configure(with: ("Deposit Amount", "\(depositAmount)"))
            cell.onValueChange = { [weak self] value in
                self?.depositAmount = Double(value) ?? 0.0
                self?.updateCalculation()
            }
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell", for: indexPath) as! InputCell
            cell.configure(with: ("Interest Rate (%)", "\(interestRate)"))
            cell.onValueChange = { [weak self] value in
                self?.interestRate = Double(value) ?? 0.0
                self?.updateCalculation()
            }
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell", for: indexPath) as! InputCell
            cell.configure(with: ("Term (months)", "\(term)"))
            cell.onValueChange = { [weak self] value in
                self?.term = Int(value) ?? 0
                self?.updateCalculation()
            }
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultCell
            cell.configure(with: viewModel.formattedResult)
            return cell
            
        default:
            fatalError("Unexpected row index")
        }
    }
    
    private func updateCalculation() {
        viewModel.updateDepositDetails(amount: depositAmount, rate: interestRate, term: term)
        tableView.reloadRows(at: [IndexPath(row: 3, section: 0)], with: .automatic)
    }
}


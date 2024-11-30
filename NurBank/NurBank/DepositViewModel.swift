import Foundation

class DepositViewModel {
    private var depositDetails = DepositDetails(depositAmount: 0.0, interestRate: 0.0, termInMonths: 0)
    
    var formattedResult: String {
        let result = calculateDepositReturn()
        return String(format: "%.2f", result)
    }
    
    func updateDepositDetails(amount: Double, rate: Double, term: Int) {
        depositDetails = DepositDetails(depositAmount: amount, interestRate: rate, termInMonths: term)
    }
    
    private func calculateDepositReturn() -> Double {
        let rate = depositDetails.interestRate / 100
        let months = Double(depositDetails.termInMonths)
        return depositDetails.depositAmount * pow(1 + rate, months / 12)
    }
}


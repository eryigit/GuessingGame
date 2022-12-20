
import UIKit

class GuessingScreenVC: UIViewController {
    
    
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var remainingGuessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    
    var randomNumber: Int?
    var remainingGuess = 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int.random(in: 1..<50)
        print(randomNumber!)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if let getData = sender as? Bool {
            let resultVC = segue.destination as! ResultScreenVC
            resultVC.result = getData
        }
        
    }
    
    @IBAction func guessButton(_ sender: Any) {
        
        if let data = guessTextField.text {
            if let guess = Int(data) {
                if remainingGuess != 0 {
                    if guess == randomNumber! {
                        let result = true
                        performSegue(withIdentifier: "resultVC", sender: result)
                    }
                    if guess > randomNumber! {
                        helpLabel.isHidden = false
                        helpLabel.text = "Decrease"
                        remainingGuess -= 1
                        remainingGuessLabel.text = "Your remaining guess : \(remainingGuess)"
                    }
                    if guess < randomNumber! {
                        helpLabel.isHidden = false
                        helpLabel.text = "Increase"
                        remainingGuess -= 1
                        remainingGuessLabel.text = "Your remaining guess : \(remainingGuess)"
                    }
                }
                    if remainingGuess == 0 {
                        let result = false
                        performSegue(withIdentifier: "resultVC", sender: result)
                }
                guessTextField.text = ""
            }
        }
    }
    
}

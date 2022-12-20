
import UIKit

class ResultScreenVC: UIViewController {

    @IBOutlet weak var imageViewResult: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Result Screen"
        
        if result! {
            resultLabel.text = "You Won"
            imageViewResult.image = UIImage(named: "smileImage")
        }else{
            resultLabel.text = "You Lost"
            imageViewResult.image = UIImage(named: "sadImage")
        }
    }
    
    @IBAction func playAgainBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}

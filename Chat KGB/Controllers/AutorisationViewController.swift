
import UIKit

class AutorisationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)

    
    }
    
    @IBAction func fbButtonTapped(_ sender: UIButton) {
        
    }
    
    
    @IBAction func googleButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func appleButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func phoneButtonTapped(_ sender: UIButton) {
        navControllerPresentNextVC(withIdentifire: "PhoneViewController")
        navigationController?.navigationItem.title = "Phone Autorisation"
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
    }
    

}

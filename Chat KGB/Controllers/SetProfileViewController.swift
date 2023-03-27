import UIKit

class SetProfileViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet var avatarImageView: UIImageView!  {
        didSet {
            avatarImageView.layer.masksToBounds = true
            avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
        }
    }
    @IBOutlet var profileTextView: [UITextView]!
    @IBOutlet var continueButton: Button!
    let imagePicker = UIImagePickerController()
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.buttonDisable()
        setNotification()
        addGesture()
        imagePicker.delegate = self
        
    }
    //MARK: - Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        profileTextView.forEach { textView in
            textView.resignFirstResponder()
        }
    }
    func addGesture() {
        let recognizer = UITapGestureRecognizer(target: self,
                                             action: #selector(changeAvatarImage))
        recognizer.isEnabled = true
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(recognizer)
    }
    @objc func changeAvatarImage() {
        showAlert()
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "main", sender: nil)
    }
    //MARK: - TextViewDelegate
}
extension SetProfileViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor != .white {
            textView.textColor = .white
            textView.text = ""
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        if (profileTextView.filter{ ($0.text != "") && ($0.textColor == .white) }.count == 4) {
            continueButton.buttonEnable()
        } else {
            continueButton.buttonDisable()
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            switch textView.tag {
            case 0: profileTextView[1].becomeFirstResponder()
            case 1: profileTextView[2].becomeFirstResponder()
            case 2: profileTextView[3].becomeFirstResponder()
            case 3: profileTextView[3].resignFirstResponder()
            default:
                return true
            }
            return false
        }
        return true
    }
    
}
extension SetProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePicker = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            avatarImageView.image = imagePicker
        }
        dismiss(animated: true)
    }
}


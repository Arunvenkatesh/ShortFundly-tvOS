
import UIKit
import FocusTvButton

class rrViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = FocusTvButton(frame: CGRect(x: 70, y: 300, width: 500, height: 100))
        button.focusedBackgroundColor = .green
        button.normalBackgroundColor = .lightGray
        view.addSubview(button)
    }
}


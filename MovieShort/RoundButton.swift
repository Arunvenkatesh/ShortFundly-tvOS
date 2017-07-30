

import UIKit

@IBDesignable class Round: UIButton{
    @IBInspectable var cradius : CGFloat = 0 {
        didSet{
            layer.cornerRadius = cradius
        }
    }
    @IBInspectable var bwidth : CGFloat = 0 {
        didSet{
            layer.borderWidth = bwidth
        }
    }
    }
    
    


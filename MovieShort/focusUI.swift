import UIKit
class CustomFocusView: UIView {
    
    
    override var canBecomeFocused: Bool {
        return true
    }
    //We Can chance the focus behavior.... Is a good idea if we evidence it
     func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        
        //Bahavior we will trigger when view lost focus
        if context.previouslyFocusedView === self
        {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                context.previouslyFocusedView?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }
        
        //Bahavior we will trigger when view get focus
        if context.nextFocusedView === self
        {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                context.nextFocusedView?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
        }
        
    }
    
}

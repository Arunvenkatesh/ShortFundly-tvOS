import UIKit

class CustomFocusButton: UIButton {
    
    
    let focusedScaleFactor : CGFloat = 1.2
    let focusedShadowRadius : CGFloat = 10
    let focusedShadowOpacity : Float = 0.25
    let shadowColor = UIColor.black.cgColor
    let shadowOffSetFocused = CGSize.init(width: 0, height: 27)
    let animationDuration = 0.2
    
     func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator)
    {
        coordinator.addCoordinatedAnimations({
            if self.isFocused{
                UIView.animate(withDuration: self.animationDuration, animations:{ [weak self] () -> Void in
                    
                    guard let weakSelf = self else {return}
                    weakSelf.transform = CGAffineTransform(scaleX: weakSelf.focusedScaleFactor, y: weakSelf.focusedScaleFactor)
                    weakSelf.clipsToBounds = false
                    weakSelf.layer.shadowOpacity = weakSelf.focusedShadowOpacity
                    weakSelf.layer.shadowRadius = weakSelf.focusedShadowRadius
                    weakSelf.layer.shadowColor = weakSelf.shadowColor
                    weakSelf.layer.shadowOffset = weakSelf.shadowOffSetFocused
                    
                    },completion:{ [weak self] finished in
                        
                        guard let weakSelf = self else {return}
                        if !finished{
                            weakSelf.transform = CGAffineTransform(scaleX: weakSelf.focusedScaleFactor, y: weakSelf.focusedScaleFactor)
                            weakSelf.clipsToBounds = false
                            weakSelf.layer.shadowOpacity = weakSelf.focusedShadowOpacity
                            weakSelf.layer.shadowRadius = weakSelf.focusedShadowRadius
                            weakSelf.layer.shadowColor = weakSelf.shadowColor
                            weakSelf.layer.shadowOffset = weakSelf.shadowOffSetFocused
                        }
                        
                })
            } else {
                UIView.animate(withDuration: self.animationDuration, animations:{  [weak self] () -> Void in
                    guard let weakSelf = self else {return}
                    
                    weakSelf.clipsToBounds = true
                    weakSelf.transform = CGAffineTransform.identity
                    
                    }, completion: {[weak self] finished in
                        guard let weakSelf = self else {return}
                        if !finished{
                            weakSelf.clipsToBounds = true
                            weakSelf.transform = CGAffineTransform.identity
                        }
                })
            }
        }, completion: nil)
    }
    
     func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        UIView.animate(withDuration: animationDuration, animations: { [weak self] () -> Void in
            
            guard let weakSelf = self else {return}
            weakSelf.transform = CGAffineTransform.identity
            weakSelf.layer.shadowOffset = CGSize.init(width: 0, height: 21)
            
        })
    }
    
     func pressesCancelled(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        
        if isFocused{
            UIView.animate(withDuration: animationDuration, animations: { [weak self] () -> Void in
                guard let weakSelf = self else {return}
                weakSelf.transform = CGAffineTransform(scaleX: weakSelf.focusedScaleFactor, y: weakSelf.focusedScaleFactor)
                weakSelf.layer.shadowOffset = weakSelf.shadowOffSetFocused
            })
        }
        
    }
    
    
     func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        
        if isFocused{
            UIView.animate(withDuration: animationDuration, animations: {[weak self] () -> Void in
                
                guard let weakSelf = self else {return}
                weakSelf.transform = CGAffineTransform(scaleX: weakSelf.focusedScaleFactor, y: weakSelf.focusedScaleFactor)
                weakSelf.layer.shadowOffset = weakSelf.shadowOffSetFocused
            })
        }
    }
}

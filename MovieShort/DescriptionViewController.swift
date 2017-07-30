import UIKit

class DescriptionViewController: UIViewController {
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var cat_name: UILabel!
    @IBOutlet weak var viewsCount: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var desp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        mainTitle.text = movie[0].title
        cat_name.text = movie[0].cat_name
        viewsCount.text = movie[0].views
        ownerName.text = movie[0].ownerName
        desp.text = movie[0].descriptions
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapping))
        self.detailView.isUserInteractionEnabled = true
        detailView.addGestureRecognizer(tap)
    
    }
    func onTapping(){
        
        print("Tapping======>>>")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mapViewControllerObj = storyBoard.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        self.present(mapViewControllerObj, animated : true, completion: nil)
        
        
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}

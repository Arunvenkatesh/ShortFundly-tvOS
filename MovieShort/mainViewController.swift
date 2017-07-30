
import UIKit
import Alamofire
import FocusTvButton

var movie = [Movie]()

class mainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{


    @IBOutlet weak var recentFlimsButton: FocusTvButton!
    @IBOutlet weak var trendingButton: FocusTvButton!
    @IBOutlet weak var topRatedButton: FocusTvButton!
    @IBOutlet weak var mostLikedButton: FocusTvButton!
    @IBOutlet weak var mostViewedButton: FocusTvButton!
    
    

    
    
    var searchController = UISearchController()
    var resultController = UICollectionViewController()
    
    
    
    var fetchedMovie = [Movie]()
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet var menu: [UIButton]!
    
    
    
    @IBAction func menuTapped(_ sender: UIButton) {
   
        let movie = movieURL()
        var url : String
        
        print("Tag=========>>>\(sender.tag)")
        
        switch sender.tag {
            
        case 10:
            
            url = movie.getRecentFlims()
            break
        case 20:
            url = movie.getTrendingFlims()
            break
        case 30:
            url = movie.getTopRated()
            break
        case 40:
            url = movie.getMostLiked()
        default:
            url = movie.getMostViewed()
        }
        
        apicall(url: url)
    
    }
    
    
    
    var isFocused = true
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   apicall(url: "http://api.shortfundly.com/film/recent_films/")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return fetchedMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
      
      let imgURL = NSURL(string: fetchedMovie[indexPath.row].poster)
        let request = URLRequest(url:imgURL! as URL)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) -> Void in
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                cell.imageViewCell.image = image
            })
        };task.resume()
        cell.titleCell.text = fetchedMovie[indexPath.row].title
        cell.regionCell.text = fetchedMovie[indexPath.row].region_name
        let rr = secondsToHoursMinutesSeconds(second: fetchedMovie[indexPath.row].duration)
        cell.timeCell.text = rr
        cell.viiewsCell.text = fetchedMovie[indexPath.row].views
       

        return cell
        
    }
    func secondsToHoursMinutesSeconds (second : String) -> (String) {
        
        
        
      let seconds = (second as NSString).integerValue
        
        let hr = seconds / 3600
        let minute = seconds % 3600 / 60
         let ss =      seconds % 3600 % 60
        return ("\(hr):\(minute):\(ss)")
    }
   
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("fetchedMovie=================>>>\(fetchedMovie[indexPath.row]) hello")
    performSegue(withIdentifier: "ContentSegue", sender: fetchedMovie[indexPath.row])
        
    }
   
    
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "ContentSegue" {
            movie = [sender as! Movie]
        }
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.layer.borderWidth = 5.0
//        cell?.layer.borderColor = UIColor.blue.cgColor
//        return true
//    }
//


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func apicall(url: String)
    {
       self.fetchedMovie.removeAll()
        let MY_API_KEY = "9e6ef43dbc0ed1bc1005014515cabaa3c4a2ae15"
        let lheaders: HTTPHeaders = [
            "X-API-Key": MY_API_KEY,
            "Accept": "application/json"
        ]
        Alamofire.request(url, headers: lheaders).responseJSON { response in
            // debugPrint(response)
            
            guard let res = response.value as? [String : Any] else {
                return
            }
        
            let fetchedResult = res["results"] as? [[String : Any]]
           
            for eachResult in fetchedResult!{
                let id = eachResult["id"] as? String
                let title = eachResult["title"] as? String
                let poster = eachResult["thumb"] as? String
                let duration = eachResult["duration"] as? String
                let source = eachResult["source"] as? String
                let views = eachResult["views"] as? String

                let reg_id = eachResult["reg_id"] as? String
                let ownerName = eachResult["owner"] as? String
                let descriptions = eachResult["description"] as? String
                let cat_name = eachResult["cat_name"] as? String
                let region_name = eachResult["region_name"] as? String
                
                self.fetchedMovie.append(Movie(id: id ?? "", title : title ?? "" ,poster : poster ?? "" ,duration : duration ?? "" , source : source ?? "", views : views ?? "", cat_name : cat_name ?? "", region_name : region_name ?? "", reg_id : reg_id ?? "", ownerName: ownerName ?? "",descriptions: descriptions ?? ""))
            
            }   
            
            self.myCollectionView.contentOffset = CGPoint.zero
           self.myCollectionView.reloadData()
        }
    }

    
    
    
}

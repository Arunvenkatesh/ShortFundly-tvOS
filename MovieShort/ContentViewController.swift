import UIKit
import MediaPlayer
import YTVimeoExtractor
import AVKit
import AVFoundation


class ContentViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var cat_name: UILabel!
    @IBOutlet weak var viewsCount: UILabel!
    @IBOutlet weak var ownerName: UILabel!    
    @IBOutlet weak var backDrop: UIImageView!
    let playerViewController = AVPlayerViewController()
   
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        let rr = "https://vimeo.com/172773855"
        YTVimeoExtractor.shared().fetchVideo(withVimeoURL: rr, withReferer: nil, completionHandler: {(_ video: YTVimeoVideo?, _ error: Error?) -> Void in
            if (video != nil) {
                
                let highQualityURL = video?.highestQualityStreamURL()
                
                let player = AVPlayer(url: highQualityURL!)
                
                self.playerViewController.player = player
                
                NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.playerViewController.player?.currentItem)
                
                self.present(self.playerViewController, animated: true) {
                    self.playerViewController.player!.play()
                }
            }
                
            else
            {
                let alert = UIAlertController(title: error?.localizedDescription , message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
            }
        }
        )
        

    }
    
    func playerDidFinishPlaying(note: NSNotification) {
        playerViewController.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         mainTitle.text = movie[0].title
         cat_name.text = movie[0].cat_name
         viewsCount.text = movie[0].views
          ownerName.text = movie[0].ownerName
        let urll = NSURL(string: movie[0].poster)
        let data1 = URLRequest(url: urll! as URL)
        let task = URLSession.shared.dataTask(with: data1 as URLRequest) {(data, response, error) -> Void in
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.backDrop.image = image
            })
        };task.resume()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


import Foundation
import UIKit

class Movie: NSObject {
    
    
    var id : String = ""
    var title : String = ""
    var descriptions : String = ""
    var user_id : String = ""
    var poster : String = ""
    var views : String = ""
    var liked : String = ""
    var duration : String = ""
    var reg_id: String = ""
    var region_name: String = ""
    var cat_name: String = ""
    var source: String = ""
    var category: String = ""
    var ownerName: String = ""
    
    
    init(id: String ,title : String ,poster : String ,duration : String , source : String, views : String, cat_name : String,region_name : String , reg_id : String, ownerName : String, descriptions : String){
        self.id = id
        self.title = title
        self.poster = poster
        self.duration = duration
        self.source = source
        self.views = views
        self.cat_name = cat_name
        self.region_name = region_name
        self.reg_id = reg_id
        self.ownerName = ownerName
        self.descriptions = descriptions
    }
    
    
    
}

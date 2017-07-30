
import Foundation

class movieURL{
    
    var RecentFlims: String = "http://api.shortfundly.com/film/recent_films/"
    var TrendingFlims: String = "http://api.shortfundly.com/film/trending_films/"
    var TopRated: String = "http://api.shortfundly.com/film/toprated/"
    var MostLiked: String = "http://api.shortfundly.com/film/most_liked/"
    var MostViewed: String = "http://api.shortfundly.com/film/most_viewed/"
    
    
    
    func getRecentFlims() -> String {
        return RecentFlims
    }
    
    func getTrendingFlims() -> String {
        return TrendingFlims
    }
    
    func getTopRated() -> String {
        return TopRated
    }
    
    func getMostLiked() -> String {
        return MostLiked
    }
    
    func getMostViewed() -> String {
        return MostViewed
    }
}

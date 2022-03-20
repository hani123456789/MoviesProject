//
//  MoviesService.swift
//  BestMovies
//
//  Created by HaniMac on 19/03/2022.
//
import Foundation

class MoviesService: MoviesServiceProtocol {
    
    private let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
    private let baseURL = "https://api.themoviedb.org/3"
    
    func getListMovie(onCompletion: @escaping ([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(baseURL)/discover/movie?api_key=\(apiKey)")! as URL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                guard let jsonArray = json["results"] as? [[String: Any]] else {
                      return
                }
                var movies = [Movie]() //Initialising Model Array
                for dic in jsonArray{
                    movies.append(Movie(dic)) // adding now value in Model array
                }
                onCompletion(movies)
            } catch {
                onCompletion([])
            }
        })
        task.resume()
    }
    
    func getDetailsOfMovie(movieId: Int, onCompletion: @escaping (Movie?) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(baseURL)/movie/\(movieId)?api_key=\(apiKey)")! as URL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                onCompletion(Movie(json))
            } catch {
                onCompletion(nil)
            }
        })
        task.resume()
    }
    
}

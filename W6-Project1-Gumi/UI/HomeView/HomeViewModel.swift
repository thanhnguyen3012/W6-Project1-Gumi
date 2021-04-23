//
//  HomeViewModel.swift
//  W6-Project1-Gumi
//
//  Created by Thành Nguyên on 20/04/2021.
//

import UIKit

protocol HomeViewModelEvents: class {
    func startProccessing()
    func finishProccessing()
    func error(error: Error)
}

class HomeViewModel {
    
    weak var delegate: HomeViewModelEvents?
    var listOfMovie = [Movie]()
    
    init(delegate: HomeViewModelEvents) {
        self.delegate = delegate
    }
    
    //This function get data from TMDb API
    func getData() {
        delegate?.startProccessing()
        
        //This API return list of popular movies
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=e2ffb4c58cb6e89d595184de8a19af94&language=en-US&page=1")!
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler: { (data, respond, error) in
            
            if let httpStatus = respond as? HTTPURLResponse {
                if error == nil && httpStatus.statusCode != 200 {
                    self.delegate?.error(error: respond as! Error)
                } else {
                    if let err = error {
                        self.delegate?.error(error: err)
                    } else {
                        guard let data = data else { return }
                        self.convertDataToMoviePage(data: data)
                    }
                    
                }
            }
        })
        
        task.resume()
    }
    
    fileprivate func convertDataToMoviePage(data: Data) {
        let decoder = JSONDecoder()
        
        do {
            let page = try decoder.decode(MoviePage.self, from: data)
            self.listOfMovie.append(contentsOf: page.results)
            DispatchQueue.main.async {
                self.delegate?.finishProccessing()
            }
        } catch {
            self.delegate?.error(error: error)
        }
        
    }
}

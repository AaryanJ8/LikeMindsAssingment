//
//  ViewModel.swift
//  Assignment
//
//  Created by satyam singh on 02/06/23.
//

import Foundation

class ViewModel {
    
    var delegate: ViewControllerDelegate?
    static let functions = ViewModel()
    
    func fetchData() {
        var reqObj: ResponseReceived?
        guard let url = URL(string: "https://itunes.apple.com/search?term=adele") else {
            print("Invalid URL")
            return
        }
        let req = URLRequest(url: url)
        URLSession.shared.dataTask(with: req, completionHandler: { data, response, error in
            if let data = data, error == nil {
                do {
                    reqObj = try JSONDecoder().decode(ResponseReceived.self, from: data)
                    self.delegate?.getData(resultArray: reqObj!.results)
                }
                catch{
                    print("Could not decode data")
                }
            }
        }).resume()
    }
    
    
}

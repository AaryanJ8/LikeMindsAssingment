//
//  ViewController.swift
//  Assignment
//
//  Created by satyam singh on 02/06/23.
//

import UIKit

protocol ViewControllerDelegate {
    func getData(resultArray: [Result])
}

class ViewController: UIViewController {
    
    var dataSource: [Result]?
    var imageArray: [UIImage]?
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        ViewModel.functions.delegate = self
        ViewModel.functions.fetchData()
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = dataSource?.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        if let item = dataSource?[indexPath.row]{
            cell.artistName.text = item.artistName
            cell.collectionName.text = "Collection Name : " + (item.collectionName ?? "NA")
            cell.descriptionLabel.text = "Description : " + (item.description ?? "No description")
            cell.trackCount.text = "Track Count : " + String(item.trackCount ?? 0)
        }
        
        
        URLSession.shared.dataTask(with: URL(string: (dataSource?[indexPath.row].artworkUrl100)!)!, completionHandler: {data, response, error in
            guard let mimeType = response?.mimeType,mimeType.hasPrefix("image"),
                  let data = data,error == nil
            else {return}
            DispatchQueue.main.async {
                cell.coverImage.image = UIImage(data: data)
            }
            print(data)
        }).resume()
        
        return cell
    }
}	
    
extension ViewController: ViewControllerDelegate {
    func getData(resultArray: [Result]) {
        self.dataSource = resultArray
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
    }
}


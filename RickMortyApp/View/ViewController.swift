//  ViewController.swift
//  RickMortyApp

import UIKit
import Apollo
import SnapKit

// switch between characters
enum RickMorty {
    case rick
    case morty
    case all
}

class ViewController: UIViewController{
    
    let tableview = UITableView()
    let viewModel = RickMortyViewModel()
    var char = [Result]()
    
    var rickMorty = RickMorty.all

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        configureTableView()
    }
    
    func configureTableView(){
        
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(RickMortyCustomCell.self, forCellReuseIdentifier: Constants.customCellIdentifier)
        tableview.frame = self.view.frame
        navigationItem.title = "Rick and Morty with GraphQL"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(filterTapped))
        
       
       
    }
        
    func getData(){
        viewModel.delegate = self
        viewModel.getAll { result in self.char = result!
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    @objc func filterTapped(){
        
        let alert = UIAlertController(title: "Info", message: "Choose Character", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Rick", style: UIAlertAction.Style.default, handler: { _ in
            self.rickMorty = .rick
        }))
        
        alert.addAction(UIAlertAction(title: "Morty", style: UIAlertAction.Style.default, handler: { _ in
            self.rickMorty = .morty
        }))
        
        self.present(alert, animated: true)
        
    }

}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4

    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return char.count
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RickMortyCustomCell = tableview.dequeueReusableCell(withIdentifier: Constants.customCellIdentifier) as? RickMortyCustomCell else {
            return UITableViewCell()
        }
        cell.myCell = char[indexPath.row]
        return cell
    
    }
}

extension ViewController: RickMortyDelegate {
    func requestSuccess() {
        switch self.rickMorty {
        case .rick:
            viewModel.getRick { result in
                self.char = result ?? []
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        case .morty:
            viewModel.getMorty { result in
                self.char = result ?? []
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        case .all:
            viewModel.getAll { result in
                self.char = result ?? []
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        }
    }
}


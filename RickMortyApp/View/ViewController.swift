//  ViewController.swift
//  RickMortyApp

import UIKit
import Apollo
import SnapKit

class ViewController: UIViewController{
    
    let tableview = UITableView()
    let viewModel = RickMortyViewModel()
    var char = [Result]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        configureTableView()
        
        navigationItem.title = "Rick and Morty"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterTapped))
        

    }
    
    func configureTableView(){
        navigationController?.isNavigationBarHidden = false
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(RickMortyCustomCell.self, forCellReuseIdentifier: Constants.customCellIdentifier)
        tableview.frame = self.view.frame
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
        PopUp.selectCharacter(view: self, title: "Info", message: "choose")
    }

}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.frame.height / 4
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

extension ViewController:RickMortyDelegate{
    func getRick() {
        viewModel.getRick { result in
            self.char = result!
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    func getMorty() {
        viewModel.getMorty { result in
            self.char = result!
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    func getAll() {
        viewModel.getAll { result in
            self.char = result!
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
}


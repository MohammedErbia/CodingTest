
//
//  ViewController.swift
//  CodingTest
//
//  Created by mohammed on 9/6/20.
//  Copyright © 2020 mohammedErbia. All rights reserved.
//

import UIKit 
class ViewController: UIViewController {
    var data : [Item] = []
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.estimatedRowHeight = 100
        self.table.rowHeight = UITableView.automaticDimension
        loadData()
    }
    private func loadData()  {
        if !Networke.Netwoke.connectedToNetwork(){
            self.showHUD(title: "NO INTRINT CONICTION",details: "Show Local Data ")
            loaddata { (err, data) in
                if err != nil{
                    self.showHUD(title: "some error", details: err?.localizedDescription )
                }else{
                    if let data = data{
                        self.data = data.items ?? []
                        self.table.reloadData()
                    }
                }
            }
        }else{
            NetworkClient.Request(self, Realestates.self, router: .realestates) { (data, err) in
                if err != nil{
                    print("Some error \(String(describing: err?.localizedDescription))")
                    self.showHUD(title: "some error", details: err?.localizedDescription )
                }else{
                    if let data = data{
                        self.data = data.items ?? []
                        self.table.reloadData()
                        self.hidHUD()
                    }
                }
            }
        }
    }
}

//MARK:- ViewController
extension ViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = self.data[indexPath.row].title ?? "err title"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.data = self.data[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

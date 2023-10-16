//
//  PointsTableViewController.swift
//  StarWarsTournament
//
//  Created by Ashish Ranjan on 16/10/23.
//

import UIKit

class PointsTableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = UserMatchesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserPointsTableViewCell", for: indexPath) as? MatchDataCell else {
            return UITableViewCell()
        }
        cell.matchData = viewModel.matches[indexPath.row]
        return cell
            
    }
    

}

extension PointsTableViewController {
    func configure() {
        tableView.register(UINib(nibName: "UserPointsTableViewCell", bundle: nil), forCellReuseIdentifier: "UserPointsTableViewCell")
    }
    
    func initModel() {
        viewModel.fetchMatchesData()
    }
    
    func observeData() {
        viewModel.responseBlock = { [weak self] state in
            switch state {
            case .dataLoaded:
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            default:
                print(state)
            }
            
        }
    }
}

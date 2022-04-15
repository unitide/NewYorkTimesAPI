//
//  NYTViewController.swift
//  NewYorkTimesAPI
//
//  Created by Mingyong Zhu on 4/13/22.
//

import UIKit

class NYTViewController: UIViewController {
    private var viewModel = ViewModel()
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        //ted object to the new view controller.
    }
    */
}

extension NYTViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let archiveVC = storyboard.instantiateViewController(withIdentifier: "archieveViewController") as UIViewController
            if let navi = self.navigationController {
                navi.pushViewController(archiveVC, animated: true)
            }
            
        default:
            return
        }
    }
}

extension NYTViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.NYTAPIs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = viewModel.NYTAPIs[indexPath.row]
        cell.textLabel?.textColor = .red
        cell.textLabel?.font = .systemFont(ofSize: 20)
        cell.detailTextLabel?.text = "Tap me!"
        return cell
    }
}

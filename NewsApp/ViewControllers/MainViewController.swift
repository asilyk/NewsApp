//
//  MainViewController.swift
//  NewsApp
//
//  Created by Alexander on 10.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newsTVC = segue.destination as? NewsTableViewController else { return }
        guard let senderButton = sender as? UIButton else { return }

        newsTVC.period = senderButton.tag
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showTableView", sender: sender)
    }
}

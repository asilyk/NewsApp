//
//  MainViewController.swift
//  NewsApp
//
//  Created by Alexander on 10.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var todayButton: UIButton!
    @IBOutlet var thisWeekButton: UIButton!
    @IBOutlet var thisMonthButton: UIButton!

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newsTVC = segue.destination as? NewsTableViewController else { return }

        switch segue.identifier {
        case "todayDataSegue": newsTVC.period = 1
        case "thisWeekDataSegue": newsTVC.period = 7
        default: newsTVC.period = 30
        }
    }

}

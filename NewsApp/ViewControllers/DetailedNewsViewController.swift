//
//  DetailedNewsViewController.swift
//  NewsApp
//
//  Created by Alexander on 09.02.2022.
//

import UIKit

class DetailedNewsViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var bylineLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var abstractLabel: UILabel!

    // MARK: - Public Properties
    var result: ArticleData!

    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = result.title
        bylineLabel.text = result.byline
        dateLabel.text = result.date
        abstractLabel.text = result.bodyText
    }
}

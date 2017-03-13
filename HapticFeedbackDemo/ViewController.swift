//
//  ViewController.swift
//  HapticFeedbackDemo
//
//  Created by Jayesh Kawli on 3/12/17.
//  Copyright © 2017 Jayesh Kawli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var hapticFeedbackOptions: [String] = ["Success", "Warning", "Error", "Light Feedback", "Medium Feedback", "Heavy Feedback", "Selection Change"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }

    // MARK: tableView dataSource methods.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = hapticFeedbackOptions[indexPath.row]
        return cell
    }

    // MARK: tableView delegate method.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.generateFeedbackWithOption(index: indexPath.row)
    }

    func generateFeedbackWithOption(index: Int) {
        switch index {
        case 0:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.success)
        case 1:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.error)
        case 2:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.warning)
        case 3:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.prepare()
            generator.impactOccurred()
        case 4:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.prepare()
            generator.impactOccurred()
        case 5:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.prepare()
            generator.impactOccurred()
        case 6:
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
        default:
            break
        }
    }
}


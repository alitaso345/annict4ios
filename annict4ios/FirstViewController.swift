//
//  FirstViewController.swift
//  annict4ios
//
//  Created by arisu-maruyama on 2017/04/04.
//  Copyright © 2017年 alitaso345. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var episodeList: [String] = ["クズの本懐", "幼女戦記", "小林さんちのメイドラゴン"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //テーブルの行数を追加する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)

        let episodeTitle = episodeList[indexPath.row]
        cell.textLabel?.text = episodeTitle
        return cell
    }


}


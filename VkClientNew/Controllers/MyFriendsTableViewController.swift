//
//  TableViewController.swift
//  VkClientNew
//
//  Created by Polina Shevchenko on 01/09/2021.
//

import UIKit

class MyFriendsTableViewController: UITableViewController {
    private var friends = [
        Name(image: UIImage(named: "David"), name: "David"),
        Name(image: UIImage(named: "Jannet"), name: "Jannet"),
        Name(image: UIImage(named: "Anna"), name: "Anna"),
        Name(image: UIImage(named: "Melissa"), name: "Melissa"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "FriendCell", bundle: nil), forCellReuseIdentifier: "customFriendCell")
    }
    

    //override func numberOfSections(in tableView: UITableView) -> Int {
      //  return 0
    //}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell (withIdentifier: "customFriendCell", for: indexPath) as? FriendCell
    else {
           return UITableViewCell()
        }
        cell.configure(name: friends[indexPath.row])
        return cell

}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true) }
        performSegue(withIdentifier: "showFriends", sender: nil)
}
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
        CGFloat {
        44.0
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.destination is MyFriendsCollectionViewController else { return }
        //weatherVC.userID = 1234
        //weatherVC.weathers.append(Weather(weather: "-14", weatherLogo: UIImage(named: "clouds"), date: "01.02.2004"))
}
}

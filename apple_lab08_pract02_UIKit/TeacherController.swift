//
//  TeacherController.swift
//  apple_lab08_pract02_UIKit
//
//  Created by Jaime Gomez on 4/5/25.
//

import UIKit

class TeacherController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    private let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.placeholder = "Search"
        sb.searchBarStyle = .minimal
        sb.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0)
        
        // Search text field customization
        if let textField = sb.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0)
            textField.layer.cornerRadius = 10
            textField.layer.masksToBounds = true
            textField.font = UIFont.systemFont(ofSize: 16)
        }
        return sb
    }()
    
    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.separatorColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0)
        tv.separatorInset = UIEdgeInsets(top: 0, left: 88, bottom: 0, right: 16)
        return tv
    }()

    private var allTeachers: [Teacher] = []
    private var filteredTeachers: [Teacher] = []
    private var isSearching: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationAndTab()
        setupUI()
        loadData()
    }
    
    private func setupNavigationAndTab() {
        navigationItem.title = "Teachers"
        tabBarItem.title = "List"
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .white
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold),
            .foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        tabBarItem = UITabBarItem(
            title: "List",
            image: UIImage(systemName: "diamond.fill"),
            tag: 0
        )
    }
    
    private func setupUI() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TeacherTableViewCell.self, forCellReuseIdentifier: TeacherTableViewCell.reuseIdentifier)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            searchBar.heightAnchor.constraint(equalToConstant: 48),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 4),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Hide keyboard when tapping background
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        tableView.addGestureRecognizer(tapGesture)
    }
    
    private func loadData() {
        allTeachers = Teacher.sampleTeachers()
        filteredTeachers = allTeachers
        tableView.reloadData()
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - UITableViewDataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredTeachers.count : allTeachers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TeacherTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? TeacherTableViewCell else {
            return UITableViewCell()
        }
        
        let teacher = isSearching ? filteredTeachers[indexPath.row] : allTeachers[indexPath.row]
        cell.configure(with: teacher)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let teacher = isSearching ? filteredTeachers[indexPath.row] : allTeachers[indexPath.row]
        
        let alert = UIAlertController(
            title: teacher.name,
            message: "Departamento: \(teacher.department)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if query.isEmpty {
            isSearching = false
            filteredTeachers = allTeachers
        } else {
            isSearching = true
            filteredTeachers = allTeachers.filter { teacher in
                teacher.name.localizedCaseInsensitiveContains(query) ||
                teacher.department.localizedCaseInsensitiveContains(query)
            }
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

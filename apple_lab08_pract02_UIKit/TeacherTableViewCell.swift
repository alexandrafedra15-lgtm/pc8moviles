//
//  TeacherTableViewCell.swift
//  apple_lab08_pract02_UIKit
//

import UIKit

class TeacherTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "TeacherTableViewCell"
    
    private let avatarContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.layer.masksToBounds = true
        return view
    }()
    
    private let initialsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let departmentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0) // #8E8E93
        return label
    }()
    
    private let chevronImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 9, weight: .bold)
        let img = UIImage(systemName: "arrowtriangle.down.fill", withConfiguration: config)
        iv.image = img
        iv.tintColor = UIColor(red: 199/255, green: 199/255, blue: 204/255, alpha: 1.0) // #C7C7CC
        iv.contentMode = .center
        return iv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
        selectionStyle = .default
        
        contentView.addSubview(avatarContainer)
        avatarContainer.addSubview(initialsLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(departmentLabel)
        contentView.addSubview(chevronImageView)
        
        NSLayoutConstraint.activate([
            // Avatar
            avatarContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            avatarContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarContainer.widthAnchor.constraint(equalToConstant: 48),
            avatarContainer.heightAnchor.constraint(equalToConstant: 48),
            
            // Initials inside Avatar
            initialsLabel.centerXAnchor.constraint(equalTo: avatarContainer.centerXAnchor),
            initialsLabel.centerYAnchor.constraint(equalTo: avatarContainer.centerYAnchor),
            
            // Name label
            nameLabel.leadingAnchor.constraint(equalTo: avatarContainer.trailingAnchor, constant: 18),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: chevronImageView.leadingAnchor, constant: -8),
            
            // Department label
            departmentLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            departmentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            departmentLabel.trailingAnchor.constraint(lessThanOrEqualTo: chevronImageView.leadingAnchor, constant: -8),
            
            // Chevron
            chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 12),
            chevronImageView.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    func configure(with teacher: Teacher) {
        nameLabel.text = teacher.name
        departmentLabel.text = teacher.department
        initialsLabel.text = teacher.initials
        initialsLabel.textColor = teacher.color
        avatarContainer.backgroundColor = teacher.color.withAlphaComponent(0.12)
    }
}

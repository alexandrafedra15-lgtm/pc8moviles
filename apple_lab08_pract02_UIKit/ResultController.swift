//
//  ResultController.swift
//  apple_lab08_pract02_UIKit
//

import UIKit

class ResultController: UIViewController {

    var calculation: CalculationModel = CalculationModel.shared

    // MARK: - UI Components
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alwaysBounceVertical = true
        return sv
    }()
    
    private let cardContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0).cgColor
        view.layer.masksToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Calculation Result"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // Operation Row
    private let operationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Operation:"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        return label
    }()
    
    private let operationValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    // First Number Row
    private let firstNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First Number:"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        return label
    }()
    
    private let firstNumberValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    // Second Number Row
    private let secondNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Second Number:"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        return label
    }()
    
    private let secondNumberValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    private let dividerLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0)
        return view
    }()
    
    private let resultHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Result:"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        return label
    }()
    
    private let resultBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let resultValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0) // #007AFF
        label.textAlignment = .center
        return label
    }()
    
    private let shareButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Share", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        btn.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        return btn
    }()
    
    private let newCalculationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("New Calculation", for: .normal)
        btn.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0).cgColor
        btn.layer.masksToBounds = true
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationAndTab()
        setupUI()
        updateData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    
    private func setupNavigationAndTab() {
        navigationItem.title = "Result"
        tabBarItem.title = "Results"
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0)
        
        tabBarItem = UITabBarItem(
            title: "Results",
            image: UIImage(systemName: "equal"),
            tag: 2
        )
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold),
            .foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(cardContainer)
        
        cardContainer.addSubview(titleLabel)
        
        cardContainer.addSubview(operationLabel)
        cardContainer.addSubview(operationValueLabel)
        
        cardContainer.addSubview(firstNumberLabel)
        cardContainer.addSubview(firstNumberValueLabel)
        
        cardContainer.addSubview(secondNumberLabel)
        cardContainer.addSubview(secondNumberValueLabel)
        
        cardContainer.addSubview(dividerLine)
        cardContainer.addSubview(resultHeaderLabel)
        
        cardContainer.addSubview(resultBox)
        resultBox.addSubview(resultValueLabel)
        
        cardContainer.addSubview(shareButton)
        cardContainer.addSubview(newCalculationButton)
        
        shareButton.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        newCalculationButton.addTarget(self, action: #selector(handleNewCalculation), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            cardContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            cardContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            cardContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            cardContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            cardContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            
            // Title
            titleLabel.topAnchor.constraint(equalTo: cardContainer.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -16),
            
            // Operation
            operationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28),
            operationLabel.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            
            operationValueLabel.centerYAnchor.constraint(equalTo: operationLabel.centerYAnchor),
            operationValueLabel.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            operationValueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: operationLabel.trailingAnchor, constant: 8),
            
            // First Number
            firstNumberLabel.topAnchor.constraint(equalTo: operationLabel.bottomAnchor, constant: 24),
            firstNumberLabel.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            
            firstNumberValueLabel.centerYAnchor.constraint(equalTo: firstNumberLabel.centerYAnchor),
            firstNumberValueLabel.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            firstNumberValueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: firstNumberLabel.trailingAnchor, constant: 8),
            
            // Second Number
            secondNumberLabel.topAnchor.constraint(equalTo: firstNumberLabel.bottomAnchor, constant: 24),
            secondNumberLabel.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            
            secondNumberValueLabel.centerYAnchor.constraint(equalTo: secondNumberLabel.centerYAnchor),
            secondNumberValueLabel.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            secondNumberValueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: secondNumberLabel.trailingAnchor, constant: 8),
            
            // Divider
            dividerLine.topAnchor.constraint(equalTo: secondNumberLabel.bottomAnchor, constant: 24),
            dividerLine.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            dividerLine.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            dividerLine.heightAnchor.constraint(equalToConstant: 1),
            
            // Result Header
            resultHeaderLabel.topAnchor.constraint(equalTo: dividerLine.bottomAnchor, constant: 24),
            resultHeaderLabel.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            
            // Result Box
            resultBox.topAnchor.constraint(equalTo: resultHeaderLabel.bottomAnchor, constant: 12),
            resultBox.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            resultBox.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            resultBox.heightAnchor.constraint(equalToConstant: 80),
            
            resultValueLabel.centerXAnchor.constraint(equalTo: resultBox.centerXAnchor),
            resultValueLabel.centerYAnchor.constraint(equalTo: resultBox.centerYAnchor),
            
            // Action Buttons
            shareButton.topAnchor.constraint(equalTo: resultBox.bottomAnchor, constant: 28),
            shareButton.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 44),
            shareButton.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: -24),
            
            newCalculationButton.topAnchor.constraint(equalTo: shareButton.topAnchor),
            newCalculationButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 12),
            newCalculationButton.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            newCalculationButton.widthAnchor.constraint(equalTo: shareButton.widthAnchor),
            newCalculationButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func updateData() {
        operationValueLabel.text = calculation.operation.rawValue
        firstNumberValueLabel.text = calculation.formattedFirstNumber
        secondNumberValueLabel.text = calculation.formattedSecondNumber
        resultValueLabel.text = calculation.formattedResult
    }
    
    // MARK: - Actions
    
    @objc private func handleShare() {
        let shareText = "Math Calculation: \(calculation.formattedFirstNumber) \(calculation.operation.symbol) \(calculation.formattedSecondNumber) = \(calculation.formattedResult)"
        let activityVC = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        
        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = shareButton
            popover.sourceRect = shareButton.bounds
        }
        present(activityVC, animated: true, completion: nil)
    }
    
    @objc private func handleNewCalculation() {
        if let nav = navigationController, nav.viewControllers.count > 1 {
            nav.popViewController(animated: true)
        } else if let tabBar = tabBarController {
            tabBar.selectedIndex = 1
        }
    }
}

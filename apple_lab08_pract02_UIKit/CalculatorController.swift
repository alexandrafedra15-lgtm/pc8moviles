//
//  CalculatorController.swift
//  apple_lab08_pract02_UIKit
//
//  Created by Jaime Gomez on 4/5/25.
//

import UIKit

class CalculatorController: UIViewController {

    private var selectedOperation: MathOperation = .addition

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
    
    private let formTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Math Operation"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // First Number Box
    private let firstNumberBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0)
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let firstNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First Number"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        return label
    }()
    
    private let firstNumberDivider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0)
        return view
    }()
    
    private let firstNumberTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = "42"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textColor = .black
        tf.keyboardType = .numbersAndPunctuation
        return tf
    }()
    
    // Second Number Box
    private let secondNumberBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0)
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let secondNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Second Number"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        return label
    }()
    
    private let secondNumberDivider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0)
        return view
    }()
    
    private let secondNumberTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = "28"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textColor = .black
        tf.keyboardType = .numbersAndPunctuation
        return tf
    }()
    
    // Operation Box
    private let operationBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0)
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let operationTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Operation"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        return label
    }()
    
    private let operationDivider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0)
        return view
    }()
    
    private let operationSelectedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Addition (+)"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private let operationArrowImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 10, weight: .semibold)
        iv.image = UIImage(systemName: "arrowtriangle.down.fill", withConfiguration: config)
        iv.tintColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        iv.contentMode = .center
        return iv
    }()
    
    // Options List Box (matches the dropdown view in calculator_screen.png)
    private let optionsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0).cgColor
        view.layer.masksToBounds = true
        return view
    }()
    
    private let btnAddition: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Addition (+)", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0), for: .normal)
        return btn
    }()
    
    private let optionDivider1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0)
        return view
    }()
    
    private let btnSubtraction: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Subtraction (-)", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private let optionDivider2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0)
        return view
    }()
    
    private let btnMultiplication: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Multiplication (×)", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()

    private let calculateButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Calculate", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationAndTab()
        setupUI()
    }
    
    private func setupNavigationAndTab() {
        navigationItem.title = "Calculator"
        tabBarItem.title = "Calculator"
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0)
        
        tabBarItem = UITabBarItem(
            title: "Calculator",
            image: UIImage(systemName: "diamond.fill"),
            tag: 1
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
        
        cardContainer.addSubview(formTitleLabel)
        
        // Setup First Number Box
        cardContainer.addSubview(firstNumberBox)
        firstNumberBox.addSubview(firstNumberTitleLabel)
        firstNumberBox.addSubview(firstNumberDivider)
        firstNumberBox.addSubview(firstNumberTextField)
        
        // Setup Second Number Box
        cardContainer.addSubview(secondNumberBox)
        secondNumberBox.addSubview(secondNumberTitleLabel)
        secondNumberBox.addSubview(secondNumberDivider)
        secondNumberBox.addSubview(secondNumberTextField)
        
        // Setup Operation Box
        cardContainer.addSubview(operationBox)
        operationBox.addSubview(operationTitleLabel)
        operationBox.addSubview(operationDivider)
        operationBox.addSubview(operationSelectedLabel)
        operationBox.addSubview(operationArrowImageView)
        
        // Setup Options Box
        cardContainer.addSubview(optionsContainer)
        optionsContainer.addSubview(btnAddition)
        optionsContainer.addSubview(optionDivider1)
        optionsContainer.addSubview(btnSubtraction)
        optionsContainer.addSubview(optionDivider2)
        optionsContainer.addSubview(btnMultiplication)
        
        cardContainer.addSubview(calculateButton)
        
        btnAddition.addTarget(self, action: #selector(selectAddition), for: .touchUpInside)
        btnSubtraction.addTarget(self, action: #selector(selectSubtraction), for: .touchUpInside)
        btnMultiplication.addTarget(self, action: #selector(selectMultiplication), for: .touchUpInside)
        calculateButton.addTarget(self, action: #selector(handleCalculate), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
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
            
            // Form Title
            formTitleLabel.topAnchor.constraint(equalTo: cardContainer.topAnchor, constant: 24),
            formTitleLabel.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 16),
            formTitleLabel.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -16),
            
            // First Number Box
            firstNumberBox.topAnchor.constraint(equalTo: formTitleLabel.bottomAnchor, constant: 24),
            firstNumberBox.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            firstNumberBox.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            firstNumberBox.heightAnchor.constraint(equalToConstant: 64),
            
            firstNumberTitleLabel.topAnchor.constraint(equalTo: firstNumberBox.topAnchor, constant: 6),
            firstNumberTitleLabel.leadingAnchor.constraint(equalTo: firstNumberBox.leadingAnchor, constant: 12),
            firstNumberTitleLabel.trailingAnchor.constraint(equalTo: firstNumberBox.trailingAnchor, constant: -12),
            
            firstNumberDivider.topAnchor.constraint(equalTo: firstNumberTitleLabel.bottomAnchor, constant: 4),
            firstNumberDivider.leadingAnchor.constraint(equalTo: firstNumberBox.leadingAnchor, constant: 12),
            firstNumberDivider.trailingAnchor.constraint(equalTo: firstNumberBox.trailingAnchor, constant: -12),
            firstNumberDivider.heightAnchor.constraint(equalToConstant: 1),
            
            firstNumberTextField.topAnchor.constraint(equalTo: firstNumberDivider.bottomAnchor, constant: 4),
            firstNumberTextField.leadingAnchor.constraint(equalTo: firstNumberBox.leadingAnchor, constant: 12),
            firstNumberTextField.trailingAnchor.constraint(equalTo: firstNumberBox.trailingAnchor, constant: -12),
            firstNumberTextField.bottomAnchor.constraint(equalTo: firstNumberBox.bottomAnchor, constant: -6),
            
            // Second Number Box
            secondNumberBox.topAnchor.constraint(equalTo: firstNumberBox.bottomAnchor, constant: 16),
            secondNumberBox.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            secondNumberBox.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            secondNumberBox.heightAnchor.constraint(equalToConstant: 64),
            
            secondNumberTitleLabel.topAnchor.constraint(equalTo: secondNumberBox.topAnchor, constant: 6),
            secondNumberTitleLabel.leadingAnchor.constraint(equalTo: secondNumberBox.leadingAnchor, constant: 12),
            secondNumberTitleLabel.trailingAnchor.constraint(equalTo: secondNumberBox.trailingAnchor, constant: -12),
            
            secondNumberDivider.topAnchor.constraint(equalTo: secondNumberTitleLabel.bottomAnchor, constant: 4),
            secondNumberDivider.leadingAnchor.constraint(equalTo: secondNumberBox.leadingAnchor, constant: 12),
            secondNumberDivider.trailingAnchor.constraint(equalTo: secondNumberBox.trailingAnchor, constant: -12),
            secondNumberDivider.heightAnchor.constraint(equalToConstant: 1),
            
            secondNumberTextField.topAnchor.constraint(equalTo: secondNumberDivider.bottomAnchor, constant: 4),
            secondNumberTextField.leadingAnchor.constraint(equalTo: secondNumberBox.leadingAnchor, constant: 12),
            secondNumberTextField.trailingAnchor.constraint(equalTo: secondNumberBox.trailingAnchor, constant: -12),
            secondNumberTextField.bottomAnchor.constraint(equalTo: secondNumberBox.bottomAnchor, constant: -6),
            
            // Operation Box
            operationBox.topAnchor.constraint(equalTo: secondNumberBox.bottomAnchor, constant: 16),
            operationBox.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            operationBox.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            operationBox.heightAnchor.constraint(equalToConstant: 64),
            
            operationTitleLabel.topAnchor.constraint(equalTo: operationBox.topAnchor, constant: 6),
            operationTitleLabel.leadingAnchor.constraint(equalTo: operationBox.leadingAnchor, constant: 12),
            operationTitleLabel.trailingAnchor.constraint(equalTo: operationBox.trailingAnchor, constant: -12),
            
            operationDivider.topAnchor.constraint(equalTo: operationTitleLabel.bottomAnchor, constant: 4),
            operationDivider.leadingAnchor.constraint(equalTo: operationBox.leadingAnchor, constant: 12),
            operationDivider.trailingAnchor.constraint(equalTo: operationBox.trailingAnchor, constant: -12),
            operationDivider.heightAnchor.constraint(equalToConstant: 1),
            
            operationSelectedLabel.topAnchor.constraint(equalTo: operationDivider.bottomAnchor, constant: 4),
            operationSelectedLabel.leadingAnchor.constraint(equalTo: operationBox.leadingAnchor, constant: 12),
            operationSelectedLabel.trailingAnchor.constraint(equalTo: operationArrowImageView.leadingAnchor, constant: -8),
            operationSelectedLabel.bottomAnchor.constraint(equalTo: operationBox.bottomAnchor, constant: -6),
            
            operationArrowImageView.centerYAnchor.constraint(equalTo: operationSelectedLabel.centerYAnchor),
            operationArrowImageView.trailingAnchor.constraint(equalTo: operationBox.trailingAnchor, constant: -12),
            operationArrowImageView.widthAnchor.constraint(equalToConstant: 14),
            operationArrowImageView.heightAnchor.constraint(equalToConstant: 14),
            
            // Options Container (Dropdown list)
            optionsContainer.topAnchor.constraint(equalTo: operationBox.bottomAnchor, constant: 8),
            optionsContainer.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            optionsContainer.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            
            btnAddition.topAnchor.constraint(equalTo: optionsContainer.topAnchor),
            btnAddition.leadingAnchor.constraint(equalTo: optionsContainer.leadingAnchor),
            btnAddition.trailingAnchor.constraint(equalTo: optionsContainer.trailingAnchor),
            btnAddition.heightAnchor.constraint(equalToConstant: 40),
            
            optionDivider1.topAnchor.constraint(equalTo: btnAddition.bottomAnchor),
            optionDivider1.leadingAnchor.constraint(equalTo: optionsContainer.leadingAnchor),
            optionDivider1.trailingAnchor.constraint(equalTo: optionsContainer.trailingAnchor),
            optionDivider1.heightAnchor.constraint(equalToConstant: 1),
            
            btnSubtraction.topAnchor.constraint(equalTo: optionDivider1.bottomAnchor),
            btnSubtraction.leadingAnchor.constraint(equalTo: optionsContainer.leadingAnchor),
            btnSubtraction.trailingAnchor.constraint(equalTo: optionsContainer.trailingAnchor),
            btnSubtraction.heightAnchor.constraint(equalToConstant: 40),
            
            optionDivider2.topAnchor.constraint(equalTo: btnSubtraction.bottomAnchor),
            optionDivider2.leadingAnchor.constraint(equalTo: optionsContainer.leadingAnchor),
            optionDivider2.trailingAnchor.constraint(equalTo: optionsContainer.trailingAnchor),
            optionDivider2.heightAnchor.constraint(equalToConstant: 1),
            
            btnMultiplication.topAnchor.constraint(equalTo: optionDivider2.bottomAnchor),
            btnMultiplication.leadingAnchor.constraint(equalTo: optionsContainer.leadingAnchor),
            btnMultiplication.trailingAnchor.constraint(equalTo: optionsContainer.trailingAnchor),
            btnMultiplication.heightAnchor.constraint(equalToConstant: 40),
            btnMultiplication.bottomAnchor.constraint(equalTo: optionsContainer.bottomAnchor),
            
            // Calculate Button
            calculateButton.topAnchor.constraint(equalTo: optionsContainer.bottomAnchor, constant: 24),
            calculateButton.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            calculateButton.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: -24)
        ])
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Operations Selection
    
    @objc private func selectAddition() {
        updateSelection(op: .addition)
    }
    
    @objc private func selectSubtraction() {
        updateSelection(op: .subtraction)
    }
    
    @objc private func selectMultiplication() {
        updateSelection(op: .multiplication)
    }
    
    private func updateSelection(op: MathOperation) {
        selectedOperation = op
        operationSelectedLabel.text = op.rawValue
        
        let blue = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)
        let black = UIColor.black
        
        btnAddition.setTitleColor(op == .addition ? blue : black, for: .normal)
        btnAddition.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: op == .addition ? .semibold : .regular)
        
        btnSubtraction.setTitleColor(op == .subtraction ? blue : black, for: .normal)
        btnSubtraction.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: op == .subtraction ? .semibold : .regular)
        
        btnMultiplication.setTitleColor(op == .multiplication ? blue : black, for: .normal)
        btnMultiplication.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: op == .multiplication ? .semibold : .regular)
    }
    
    // MARK: - Calculate Action
    
    @objc private func handleCalculate() {
        view.endEditing(true)
        
        guard let firstStr = firstNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !firstStr.isEmpty,
              let secondStr = secondNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !secondStr.isEmpty else {
            showAlert(title: "Campos Vacíos", message: "Por favor, ingrese ambos números.")
            return
        }
        
        let cleanFirstStr = firstStr.replacingOccurrences(of: ",", with: ".")
        let cleanSecondStr = secondStr.replacingOccurrences(of: ",", with: ".")
        
        guard let num1 = Double(cleanFirstStr) else {
            showAlert(title: "Número Inválido", message: "El primer número no es un valor numérico válido.")
            return
        }
        
        guard let num2 = Double(cleanSecondStr) else {
            showAlert(title: "Número Inválido", message: "El segundo número no es un valor numérico válido.")
            return
        }
        
        // Save to model
        let model = CalculationModel(operation: selectedOperation, firstNumber: num1, secondNumber: num2)
        CalculationModel.shared.operation = selectedOperation
        CalculationModel.shared.firstNumber = num1
        CalculationModel.shared.secondNumber = num2
        
        // Push ResultController
        let resultVC = ResultController()
        resultVC.calculation = model
        
        if let nav = navigationController {
            nav.pushViewController(resultVC, animated: true)
        } else {
            present(resultVC, animated: true, completion: nil)
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

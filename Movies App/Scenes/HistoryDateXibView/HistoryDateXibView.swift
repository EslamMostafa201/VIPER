//
//  HistoryDateXibView.swift
//  Medion Fitness
//
//  Created by Eslam Mostafa on 30/04/2022.
//

import UIKit

class HistoryDateXibView: UIView {
    @IBOutlet var periodButtons: [PMSuperButton]!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    let viewModel = HistoryDateXibViewModel()
    
    //MARK:- View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
        setViewDate()
        setUpPeriodButtonsUI(tagOfSelectedButton: HistoryPeriod.day.rawValue)
    }
    
    func setUpPeriodButtonsUI(tagOfSelectedButton: Int) {
        for button in periodButtons {
            if button.tag == tagOfSelectedButton {
                button.isSelected = true
                button.borderWidth = 1
                button.setTitleColor(General.hexStringToUIColor(hex: "#202D6F"), for: .selected)
            } else {
                button.isSelected = false
                button.borderWidth = 0
                button.setTitleColor(General.hexStringToUIColor(hex: "#737474"), for: .normal)
            }
        }
        
        if tagOfSelectedButton == HistoryPeriod.day.rawValue {
            viewModel.selectedPeriod = .day
        } else  if tagOfSelectedButton == HistoryPeriod.week.rawValue {
            viewModel.selectedPeriod = .week
        } else  if tagOfSelectedButton == HistoryPeriod.month.rawValue {
            viewModel.selectedPeriod = .month
        } else  {
            viewModel.selectedPeriod = .year
        }
        
        setViewDate()
    }
    
    func setViewDate() {
        dateLabel.text = viewModel.getCurrentDateFor(period: viewModel.selectedPeriod)
    }
    
    @IBAction func choosePeriodActions(_ sender: PMSuperButton) {
        setUpPeriodButtonsUI(tagOfSelectedButton: sender.tag)
    }
    
    @IBAction func nextAxtion(_ sender: UIButton) {
        dateLabel.text = viewModel.getNextDateFor(currentDate: dateLabel.text!, period: viewModel.selectedPeriod)
    }
    
    @IBAction func previousAction(_ sender: UIButton) {
        dateLabel.text = viewModel.getPreviousDateFor(currentDate: dateLabel.text!, period: viewModel.selectedPeriod)
    }
}


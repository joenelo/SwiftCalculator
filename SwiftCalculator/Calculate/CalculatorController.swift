
import UIKit

class CalculatorController: UIViewController {
    // create variables for Calculator use
    var currentNumbers: Double = 0
    var previousNumbers: Double = 0
    var doingMathCalcs = false
    var operation = 0
    var isThereAnError = false
 
    // create a clearButton function to clean the TextView
    @IBAction func clearButton(_ sender: UIButton) {
        answerTextView.text = ""
    }
    @IBOutlet weak var answerTextView: UITextView!
    
    // Numbers function for all for the Numbered buttons
    @IBAction func numbers(_ sender: UIButton) {
        
        //  See if if there is an error and set the Answer
        if isThereAnError == true {
            answerTextView.text = ""
            isThereAnError = false
        }
        
        // if pressing the number buttons set their numbers to the tags, -1 and make them Doubles
        if doingMathCalcs == true  {
            answerTextView.text = String(sender.tag-1)
            currentNumbers = Double(answerTextView.text!)!
            doingMathCalcs = false
            
        } else {
            answerTextView.text = answerTextView.text! + String(sender.tag-1)
            print(answerTextView.text)
            if let text = answerTextView.text, let number = Double(text) {
                currentNumbers = number
            } else {
                currentNumbers = 0
                answerTextView.text = ""
            }
        }
    }
    
    // create a function for the Math operator buttons
    @IBAction func mathButtons(_ sender: UIButton) {
        if answerTextView.text != "" && sender.tag != 15 {
            // Save the first number from the TextView to a variable and set it to a double.
            previousNumbers = Double(answerTextView.text!)!

            if sender.tag == 11 { //-Addition
                answerTextView.text = "+"
                answerTextView.text = "" // Don't show the Math operator sign
            }
            if sender.tag == 12 { //-Substraction
                answerTextView.text = "-"
                answerTextView.text = ""
            }
            if sender.tag == 13 { //-Multiplication
                answerTextView.text = "*"
                answerTextView.text = ""
            }
            if sender.tag == 14 { //-Division
                answerTextView.text = "/"
                answerTextView.text = ""
            }
            // save the sender tags into a variable
            operation = sender.tag
            doingMathCalcs = true
        }
            // create an area to do simple math problems, previously stored numbers plus whats in the textview currently
        else if sender.tag == 15 && answerTextView.text != "Error"{
            if operation == 11 , answerTextView.text != "Error" {
                answerTextView.text = ""
                 do {
                    self.answerTextView.text = String(self.previousNumbers + self.currentNumbers)
                }
            }
            else if operation == 12, answerTextView.text != "Error" {
                answerTextView.text = String(previousNumbers - currentNumbers)
            }
            else if operation == 13, answerTextView.text != "Error" {
                answerTextView.text = String(previousNumbers * currentNumbers)
            }
            else if operation == 14, answerTextView.text != "Error" {
                if currentNumbers > 0  {
                    answerTextView.text = String(previousNumbers / currentNumbers)
                } else {
                    answerTextView.text = "Error"
                    isThereAnError = true
                }
            }
        }
    }
}

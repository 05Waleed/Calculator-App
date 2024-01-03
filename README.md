# Calculator App Readme

## Overview

This is a simple iOS calculator app implemented in Swift using the UIKit framework. The app provides basic arithmetic operations, percentage calculation, and the ability to switch the sign of a number. It features a clean and rounded button layout, making it visually appealing and user-friendly.

## Features

- **Basic Arithmetic Operations:** Addition, subtraction, multiplication, and division are supported.

- **Percentage Calculation:** The app allows users to calculate percentages of numbers.

- **Change Sign:** Users can switch the sign of the displayed number between positive and negative.

- **Decimal Point:** The app supports decimal numbers for precise calculations.

## Dark/Light Mode Compatibility
The app seamlessly adapts to both dark and light modes, providing users with a visually comfortable experience based on their device settings.

## How to Use

1. **Number Input:** Tap the number buttons to input digits. If you're already typing a number, subsequent digits will be appended to the current input. If not, a new number input will begin.

2. **Operator Selection:** Tap the operator buttons to choose the desired arithmetic operation. If you're already typing a number, the current input will be stored as the first operand, and you can continue typing the second operand.

3. **Equals Button:** Press the equals button to perform the calculation based on the selected operator. The result will be displayed with clean formatting, removing trailing zeros if present.

4. **Clear Button:** Press the clear button to reset the calculator to its initial state. This will clear the display, reset the first operand and operator, and set the app to start typing a new number.

5. **Decimal Button:** Press the decimal point button to input a decimal point if the current number doesn't already contain one.

6. **Remove Last Digit:** The "C" button allows you to remove the last digit from the current input. If the display becomes empty, it will default to "0".

## Code Structure

The Swift code is organized as follows:

- **ViewController:** Manages the main functionality of the calculator, including number input, operator selection, calculation, and UI updates.

- **Extensions:** Contains extensions for `Double` and `String` to provide additional functionality for formatting and cleaning double values.

- **Storyboard:** The UI layout is designed using Interface Builder in the storyboard file. Autolayout constraints are set to ensure a responsive and consistent UI on various devices.

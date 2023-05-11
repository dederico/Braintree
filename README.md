# Credit Card Processing

This script allows you to process credit card transactions based on input provided in a text file.

## Requirements

- Ruby

## Getting Started

1. Clone the repository or download the script files.

   ```
   $ mkdir <YourDirectoryName>
   $ cd <YourDirectoryName>
   $ gh repo clone dederico/Braintree
   ```

2. Ensure you have Ruby installed on your system. You can check the Ruby version by running:

   ```
   $ ruby --version
   ```

   If Ruby is not installed, you can download it from the official Ruby website: [https://www.ruby-lang.org](https://www.ruby-lang.org)

3. Open a terminal or command prompt and navigate to the directory where the script files are located.

   ```
   $ cd <YourDirectoryName>
   ```

## Usage

1. Create a text file named `input.txt` and populate it with the credit card transactions you want to process. Each transaction should be written on a separate line and follow the specified format.

   ```
   Add Tom 4111111111111111 $1000
   Add Lisa 5454545454545454 $3000
   Charge Tom $500
   Credit Lisa $100
   ```

   The available commands are:
   - `Add <name> <card_number> <limit>`: Add a new credit card with the specified name, card number, and limit.
   - `Charge <name> <amount>`: Charge the specified amount to the credit card with the given name.
   - `Credit <name> <amount>`: Credit the specified amount from the credit card with the given name.

2. Run the script by executing the following command:

   ```
   $ ruby credit_card_processor.rb
   ```

3. The script will process the input file and display a summary of the credit card balances.

## Notes

- Credit card numbers must follow the Luhn algorithm for validation. Invalid card numbers will result in an "error" message.
- The script supports multiple credit card transactions and maintains a balance for each card.
- The final output will show the name of each credit card and its corresponding balance.


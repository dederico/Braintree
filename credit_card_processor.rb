class CreditCard
  attr_reader :name, :card_number, :limit
  attr_accessor :balance

  def initialize(name, card_number, limit)
    @name = name
    @card_number = card_number
    @limit = limit
    @balance = 0
  end

  def charge(amount)
    @balance += amount
  end

  def credit(amount)
    @balance -= amount
  end

  def valid?
    luhn_algorithm(card_number)
  end

  private

  # Implement the Luhn algorithm to validate credit card numbers.
  def luhn_algorithm(number)
    sum = 0
    number.to_s.reverse.chars.each_with_index do |digit, index|
      digit = digit.to_i
      digit *= 2 if index.odd?
      digit -= 9 if digit > 9
      sum += digit
    end
    (sum % 10).zero?
  end
end

class CreditCardProcessor
  def initialize
    @credit_cards = {}
  end

  def process_input(input)
    # Split input by newline or non-printable character
    lines = input.split(/[\n\u2028]/) 

    lines.each do |line|
      command, *args = line.split

      case command
      when 'Add'
        # Call the method to add a credit card
        add_card(*args) 
      when 'Charge'
        # Call the method to charge a credit card
        charge(*args) 
      when 'Credit'
        # Call the method to credit a credit card
        credit(*args) 
      end
    end
    # Display the summary of credit card balances
    display_summary 
  end

  private

  def add_card(name, card_number, limit)
    # Create a new CreditCard object
    card = CreditCard.new(name, card_number, parse_amount(limit))
    # Add the credit card to the hash of credit cards
    @credit_cards[name] = card 
  end

  def charge(name, amount)
    # Check if the credit card exists
    return unless @credit_cards.key?(name) 

    card = @credit_cards[name]
    if card.valid? && card.balance + parse_amount(amount) <= card.limit
      # Charge the credit card if it is valid and the limit allows
      card.charge(parse_amount(amount)) 
    end
  end

  def credit(name, amount)
    # Check if the credit card exists
    return unless @credit_cards.key?(name) 

    card = @credit_cards[name]
    # Credit the credit card if it is valid
    if card.valid?
      card.credit(parse_amount(amount)) 
    end
  end

  def display_summary
    # Sort the credit cards by name
    sorted_cards = @credit_cards.values.sort_by(&:name) 
    sorted_cards.each do |card|
      # Determine the balance or show "error" if invalid
      balance = card.valid? ? "$#{card.balance}" : 'error'
      # Print the name and balance of each credit card
      puts "#{card.name}: #{balance}" 
    end
  end

  def parse_amount(amount)
    # Remove the dollar sign and convert the amount to an integer
    amount.delete('$').to_i 
  end
end

# Reading input from STDIN
input = $stdin.read

processor = CreditCardProcessor.new
processor.process_input(input)

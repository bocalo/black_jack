# frozen_string_literal: true

class Bank
  attr_reader :balance

  def initialize(value)
    @balance = value
  end

  def minus(value)
    @balance -= value
  end

  def plus(value)
    @balance += value
  end
end

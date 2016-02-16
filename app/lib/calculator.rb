class Calculator
  def average(data, field)
    new_data = filter_data(data, field)
    new_data.reduce(:+) / new_data.count
  end

  def minimum(data, field)
    new_data = filter_data(data, field)
    new_data.sort[0]
  end

  def maximum(data, field)
    new_data = filter_data(data, field)
    new_data.sort[-1]
  end

  private

  def filter_data(data, field)
    data.map { |object| object[field].to_i }
  end
end


module Calculator
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

  def get_minimum_product(data, field)
    new_data = filter_data(data, field)
    minimum = new_data.sort[0]
    index = new_data.index(minimum)
    data[index]
  end

  def get_most_expensive_product(data, field)
    new_data = filter_data(data, field)
    maximum = new_data.sort[-1]
    index = new_data.index(maximum)
    data[index]
  end

  private

  def filter_data(data, field)
    data.map { |object| object[field].to_i }
  end
end

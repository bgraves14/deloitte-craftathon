module Ranking

  def all_objects(data, field)
    object_array = []
    data.each do |product|
      object_array << product[field]
    end
    object_array.flatten
  end

  def map_to_hash array
    array.each_with_object(Hash.new(0)) { |object, count| count[object] += 1 }
  end

  def sort_by_occurence hash
    hash.sort_by { |object, count| count}.reverse
  end

  def remove_occurences array
    array.reject { |_,v| v == 1 }
  end

  def most_popular array
    most_popular_array = []
    array.each do |key,_|
      most_popular_array << key
    end
    most_popular_array
  end

  def most_popular_items(data, field, array)
    most_popular_array = most_popular array
    most_popular_items = []
    data.each do |result|
      if result[field] & most_popular_array != []
        most_popular_items << result['title']
      end
    end
    most_popular_items
  end

end

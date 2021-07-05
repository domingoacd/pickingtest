# frozen_string_literal: true

require_relative 'ruby/version'
require 'json'
module Ruby
  def get_biggest_algorithm(algorithms)
    algorithms.reduce('size' => 0) { |prev, current| prev['size'] > current['size'] ? prev : current }
  end

  def create_algorithms_from_data(data)
    data_keys = data.keys
    data_keys.map do |key|
      {
        'name' => key,
        'hasElements' => true,
        'size' => data[key].length
      }
    end
  end

  def get_recommendations_from_JSON(file_path)
    file = File.read file_path
    json_data = JSON.parse file
    algorithms = create_algorithms_from_data json_data
    keep_searching = true
    result = []
    algorithm_counter = 0
    counter = 0
    biggest_algorithm = get_biggest_algorithm algorithms

    while keep_searching
      current_algorithm = algorithms[algorithm_counter]
      current_algorithm_data = json_data[current_algorithm['name']]

      if current_algorithm['hasElements']
        data_element = current_algorithm_data[counter]
        if data_element
          result.push(data_element['token'].to_i)
        else
          current_algorithm['hasElements'] = false
        end
      end

      algorithm_counter += 1
      if algorithm_counter == algorithms.length
        counter += 1
        algorithm_counter = 0
      end
      keep_searching = false if (result.length >= 4) || (counter >= biggest_algorithm['size'])
    end
    result
  end
end

class Object
  include Ruby
end

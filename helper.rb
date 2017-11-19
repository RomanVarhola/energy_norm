require 'pry'

module Helper

  def show_number(number)
    puts "Number: #{number}"
  end

  def show_vector(vector,text)
    puts text
    vector.size.times do |i|
      print vector[i].to_s + " "
    end
    puts
  end

  def show_matrix(matrix)
    puts 'Matrix:'
    i = 0
    matrix.each do |number|
      print number.to_s + " "
      i+= 1
      if i == matrix.column_size
        print "\n"
        i = 0
      end
    end
  end

  def multiple_matrix_vector(matrix, vector, n)
    temp = initial_vector
    n.times do |i|
      n.times do |j|
        temp.send(:[]=, i, matrix[i,j] * vector[j])
      end
    end
    temp
  end

  def subtraction_vectors(vector_a, vector_b, n)
    temp = initial_vector
    n.times do |i|
      temp.send(:[]=, i, vector_a[i] - vector_b[i])
    end
    temp
  end

  def sum_vectors(vector_a, vector_b, n)
    temp = initial_vector
    n.times do |i|
      temp.send(:[]=, i, vector_a[i] + vector_b[i])
    end
    temp
  end

  def scalar(vector_a, vector_b, n)
    temp = 0
    n.times do |i|
      temp += vector_a[i] * vector_b[i]
    end 
    temp
  end

  def multiple_number_vector(number, vector)
    temp = initial_vector
    vector.size.times do |i|
      temp.send(:[]=, i, vector[i] * number)
    end
    temp
  end

  def norma(vector_a, vector_b)
    temp = 0
    vector_a.size.times do |i|
      temp = (vector_a[i] - vector_b[i]).abs if temp < (vector_a[i] - vector_b[i]).abs
    end
    temp *= temp  
  end
  
  private 

  def initial_vector
    Vector[0, 0]
  end
end
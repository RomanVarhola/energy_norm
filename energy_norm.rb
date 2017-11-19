require './helper'

class EnergyNorm
  attr_reader :matrix_a, :vector_b, :n, :eps
  include Helper

  def initialize(matrix_a, vector_b, y_0, eps, n)
    @matrix_a = matrix_a
    @vector_b = vector_b
    @y_0 = y_0
    @n = n
    @eps = eps
  end

  def call
    iter = 0
    begin
      show_vector(y(iter), "y[#{iter}]:")
      iter+= 1
    end while norma(y(iter-1), y(iter)) > eps
  end

  def y iter
    if iter == 0
      @y_0
    else 
      sum_vectors(y(iter-1), multiple_number_vector(1.0 / alpha(iter-1), p(iter-1)), n) #step 2
    end
  end

  def matrix_b
    @matrix_a.inverse
  end

  def r iter
    if iter == 0
      subtraction_vectors(vector_b, multiple_matrix_vector(matrix_a, y(iter), n), n)
    else
      r(iter-1) - (1.0 / alpha(iter-1)) * multiple_matrix_vector(matrix_a, p(iter-1), n) #step 4
    end
  end

  def p iter
    if iter == 0
      r_shtrih(iter)
    else
      r_shtrih(iter) + beta(iter) * p(iter - 1) #step 8
    end
  end

  def alpha(iter) #step 1
    scalar(p(iter), p(iter), n) / sigma(iter)
  end

  def psi_kvadrat(iter) #step 3
    sigma(iter) / alpha(iter)
  end

  def r_shtrih(iter) #step 5
    multiple_matrix_vector(matrix_b, r(iter), n)
  end

  def sigma(iter) #step 6
    scalar(r(iter), r_shtrih(iter), n)
  end

  def beta(iter) #step 7
    sigma(iter) / sigma(iter - 1)
  end
end
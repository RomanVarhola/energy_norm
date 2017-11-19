#!/usr/bin/env ruby

require 'matrix'
require './energy_norm'

include Helper

n = 2
matrix_a = Matrix[ [1, 2], 
                   [3, 4] 
                 ]

vector_b = Vector[4 , 6]

y_0 = Vector[-2, 3]

eps = 0.1

en = EnergyNorm.new(matrix_a, vector_b, y_0, eps, n)
en.call
require 'shellwords'
def run_calculator( input )
  run_calculator_without_display "?#{input}"
end

def run_calculator_without_display( input )
  puts "Executing: #{input}"
  `echo '#{input}' | ./calc`
end

def formatted_result( output )
  "ANS>#{output}\n"
end

def format_result( input )
  puts "Result was[ #{input} ]"
  input.lines.last
end

def extract_float(input)
  input[4...-1].to_f
end

def derivation( input )
  input.lines[0...-1].join('')
end

def float_assert( expected, calculation, error_message )
  assert_in_delta( expected.to_f, extract_float(format_result(run_calculator(calculation))), 0.001, error_message)
end

def float_not_assert( expected, calculation, error_message )
  assert_not_in_delta( expected.to_f, extract_float(format_result(run_calculator(calculation))), 0.001, error_message)
end

def register_values(output)
  output.lines[-10..-1].collect do |line|
    line[4...-1].to_f
  end
end

def program_assert( expected_array, calculation, error_message )
  actual_array = register_values(run_calculator(calculation))
  (0..10).each do |i|
    float_assert( expected_array[i].to_f, actual_array[i].to_f, error_message)
  end
end

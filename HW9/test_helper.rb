require 'shellwords'
def run_calculator( input )
  run_calculator_without_display "?#{input}"
end

def run_calculator_without_display( input )
  puts "Executing: [\n#{input}\n]"
  `echo '#{input}' | ./calc`
end

def formatted_result( output )
  "ANS>#{output}\n"
end

def format_result( input )
  input.lines.each do |line|
    if line =~ /^ANS>.*$/
      return line
    end
  end
  puts "ERROR finding correct line"
end

def extract_float(input)
  input[4...-1].to_f
end

def derivation( input )
  input.lines[0...-1].join('')
end

def float_assert( expected, calculation, error_message, noprint=false )
  if noprint
    assert_in_delta( expected.to_f, extract_float(format_result(run_calculator_without_display(calculation))), 0.1, error_message)
  else
    assert_in_delta( expected.to_f, extract_float(format_result(run_calculator(calculation))), 0.1, error_message)
  end
end

def float_not_assert( expected, calculation, error_message, noprint=false )
  if noprint
    assert_not_in_delta( expected.to_f, extract_float(format_result(run_calculator_without_display(calculation))), 0.1, error_message)
  else
    assert_not_in_delta( expected.to_f, extract_float(format_result(run_calculator(calculation))), 0.1, error_message)
  end
end

def register_values(output)
  output.lines[-10..-1].collect do |line|
    line[4...-1].to_f
  end
end

def program_assert( expected_array, calculation, error_message )
  actual_array = register_values(run_calculator_without_display(calculation))
  (0..10).each do |i|
    assert_in_delta( expected_array[i].to_f, actual_array[i].to_f, 0.1, error_message)
  end
end

require 'shellwords'
def run_calculator( input )
  `echo '#{input}' | ./calc `
end

def formatted_result( output )
  "= #{output}\n"
end

def format_result( input )
  input.lines.last
end

def extract_float(input)
  input[2...-1].to_f
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

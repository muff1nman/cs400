def run_calculator( input )
  `echo "#{input}" | ./calc `
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

def test( expected, calculation, error_message )
  assert_in_epsilon( expected.to_f, extract_float(format_result(run_calculator(calculation))), 0.00001, error_message)
end

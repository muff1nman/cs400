def run_calculator( input )
  `echo "#{input}" | ./calc `
end

def formatted_result( output )
  "= #{output}\n"
end

def format_result( input )
  input.lines.last
end

def derivation( input )
  input.lines[0...-1].join('')
end

def test( expected, calculation, error_message )
  assert_equal( formatted_result(expected), format_result(run_calculator(calculation)), error_message)
end

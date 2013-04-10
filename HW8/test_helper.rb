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

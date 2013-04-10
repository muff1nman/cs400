def run_calculator( input )
  `echo "#{input}" | ./calc `
end

def formatted_result( output )
  "= #{output}\n"
end

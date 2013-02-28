#!/usr/bin/env ruby

# creates a tree given a file

def findTokenExpanded( original, new )
    (0...( original.length)).each do |i|
        return i if original[i] != new[i]
    end
    nil
end

def findTokensExpandedTo( original, new)
    firstIndex = findTokenExpanded( original, new) 
    stopAt = original[firstIndex + 1]
    secondIndex = firstIndex
    while ( secondIndex != new.length and stopAt != new[secondIndex] )
        secondIndex += 1
    end
    new[firstIndex...secondIndex]
end

def replaceIndexWith( array, index, newTokens) 
    puts "Inside Replace Index With: "
    puts array.inspect
    puts index.inspect
    puts newTokens.inspect
    puts "......"

    if index.length == 1
        newArray = Array.new
        newArray.push(*array[0..index[0]])
        newArray.concat(newTokens.map { |x| [x] })
        newArray.concat(array.drop(index[0]+1))
        return newArray
    end
    array[index[0]] = replaceIndexWith( array[index[0]], index.drop(1), newTokens )
    array
end

def getDoubleArrayFromFile( file )
    array = []
    File.open(file, 'r') do |f|
        f.each_line do |line|
            array << line.split(/[\n ]+/)
        end
    end

    array
end

def convertDoubleArrayToString( array )
    puts "Testing convert array to string"
    puts array.inspect
    string = "["
    array.each do |element|
        string << "#{convertDoubleArrayToString(element)} " if element.kind_of?(Array)
        string << "#{element} " if !(element.kind_of?(Array))
    end
    string += "]"
end

def updateTreeStructure( array,indexInsertAt, countOfInsertions )
    puts "HELP" if array.nil?
    puts "array: #{array.inspect} end"
    puts indexInsertAt.inspect
    newArray = Array.new(array)
    countOfInsertions.times do
        puts "Doin THIS #{indexInsertAt}"
        puts array[indexInsertAt]
        newArray.insert( indexInsertAt , array[indexInsertAt] )
    end
    puts "array: #{newArray.inspect} end"
    (1..countOfInsertions).each do |p|
        tempArray = Array.new(newArray[indexInsertAt + p])
        puts "p = #{p}"
        tempArray[-1] = p + array[indexInsertAt][-1]
        tempArray  << 0
        newArray[indexInsertAt + p] =  tempArray
    end
    (indexInsertAt + countOfInsertions + 1...newArray.length).each do |i|
        newArray[i][0] = newArray[i][0] +  1
    end
    newArray.delete_at(indexInsertAt)
    #(indexInsertAt..array.length-1).each do 
    puts "array: #{newArray.inspect} end"
    return newArray



end

def create_array( input )
    treeStructure = [[0]]

    line = 1
    array = []
    oldline = []

    input.each do |newline|
        puts "line:#{line}"
        if line == 1
            array << newline[0]
            oldline = newline
            puts oldline
            puts "HERE!"
            line += 1
            next
        end
        line += 1

        indexToReplace = findTokenExpanded( oldline, newline)
        puts indexToReplace.inspect
        newTokens = findTokensExpandedTo( oldline, newline )
        puts array.inspect
        array = replaceIndexWith( array, treeStructure[indexToReplace], newTokens )
        puts array.inspect
        puts "tree struct: #{treeStructure.inspect} end"
        puts "newtokens: #{newTokens.inspect} end"
        treeStructure = updateTreeStructure(treeStructure, indexToReplace, newTokens.length)
        puts "tree struct: #{treeStructure.inspect} end"
        puts treeStructure[indexToReplace].inspect
        oldline = newline
    end

    array

    convertDoubleArrayToString( array )

end

def create( file )
    # open file, split into array
    # split each line into an array
    # start with a single element array "<start>"
    # for each new line in the file compare, to the previous, 
    #   find the token that expanded
    #   find the tokens it expanded to
    #   replace the token that epanded with a new array consisting of the tokens
    #   expanded to

    input = getDoubleArrayFromFile( file )

    puts "input from file: #{input.inspect} end"

    create_array( input )
    
end

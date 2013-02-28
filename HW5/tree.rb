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
    string = "["
    array.each do |element|
        string << "[#{convertDoubleArrayToString(element)}] " if element.kind_of?(Array)
        string << "#{element} " if !(element.kind_of?(Array))
    end
    string += "]"
end

def updateTreeStructure( array,indexInsertAt, countOfInsertions )
    newArray = Array.new(array)
    countOfInsertions.times { newArray.insert( indexInsertAt + 1 , Array.new(array[indexInsertAt]) )}
    (1..countOfInsertions).each do |i|
        newArray[indexInsertAt + i][-1] = i 
        newArray[indexInsertAt + i] << 0
    end
    newArray

end

def create_array( input )
    array = ["start"]

    oldline = ["start"]
    treeStructure = [[0]]

    input.each do |newline|
        indexToReplace = findTokenExpanded( oldline, newline)
        newTokens = findTokensExpandedTo( oldline, newline )
        treeStructure = updateTreeStructure(treeStructure, indexInsertAt, newTokens.length)
        array = replaceIndexWith( array, treeStructure[indexToReplace], newTokens )
        oldline = newline
    end

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

    create_array( input )
    
end

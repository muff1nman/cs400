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
    array[0...index] + [newTokens] + array.drop(index+1)
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

end

def create_array( input )
    array = ["start"]

    oldline = ["start"]
    input.each do |newline|
        indexToReplace = findTokenExpanded( oldline, newline)
        newTokens = findTokensExpandedTo( oldline, newline )
        array = replaceIndexWith( array, indexToReplace, newTokens )
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

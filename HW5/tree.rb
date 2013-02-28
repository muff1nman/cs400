#!/usr/bin/env ruby

# creates a tree given a file

def findTokenExpanded( original, new )

end

def findTokensExpandedTo( original, new)

end

def replaceIndexWith( array, index, newTokens)

end

def getDoubleArrayFromFile( file )

end

def convertDoubleArrayToString( array )

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

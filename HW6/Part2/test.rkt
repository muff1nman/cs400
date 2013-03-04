#!/usr/bin/env racket
#lang racket

(require rackunit)
(require "lib.rkt")

(define articles '(
     ((Test-Driven Learning: Intrinsic Integration of Testing into the CS/SE Curriculum)
      ((David Jansen)(Hossein Saiedian))
      ("Test-driven learning" "test-driven development" "extreme programming" "pedagogy" "CS1"))
     ((Process Improvement of Peer Code Review and Behavior Analysis of its Participants)
      ((WANG Yan-qing) (LI Yi-jun) (Michael Collins) (LIU Pei-jie))
      ("peer code review" "behavior analysis" "software quality assurance" 
        "computer science education" "software engineering"))
     ((Computer Games as Motivation for Design Patterns)
      ((Paul V. Gestwicki))
      ("Design Patterns" "Games" "Pedagogy" "Java"))
     ((Killer "Killer Examples" for Design Patterns)
      ((Carl Alphonce) (Michael Caspersen) (Adrienne Decker))
      ("Object-orientation" "Design Patterns"))
     ((Test-First Java Concurrency for the Classroom)
      ((Mathias Ricken)(Robert Cartwright))
      ("CS education" "Java" "JUnit" "unit testing" "concurrent programming"
       "tools" "software engineering"))
     ((Teaching Design Patterns in CS1: a Closed Laboratory Sequence
                based on the Game of Life)
      ((Michael Wick))
      ("Design Patterns" "Game of Life" "CS1" "Laboratory"))))

(check-equal? (getTitle (car articles))
           '(Test-Driven Learning: Intrinsic Integration of Testing into the
                         CS/SE Curriculum)
           "Get Title general failure")

(check-equal? (getAuthors (car articles))
           '((David Jansen) (Hossein Saiedian))
           "Get Authors general failure")

(check-equal? (getKeywords (car articles))
           '("Test-driven learning" "test-driven development" 
             "extreme programming" "pedagogy" "CS1")
           "Get Keywords general failure")

(check-equal? (keywordSearch "Java" articles)
              '((Test-First Java Concurrency for the Classroom) 
                (Computer Games as Motivation for Design Patters))
              "keywordSearch general failure")

(check-equal? (keywordSearch "CS1" articles)
              '((Teaching Design PAtterns in CS1: a Closed Laboratory Sequence
                          based on the Game of Life)
                (Test-Driven Learning: Intrinsic Integration of Testing into the
                             CS/SE Curriculum))
              "keywordSearch general failure")

(check-equal? (keywordSearch "Rader" articles)
              '()
              "keywordSearch for an empty search")

(check-equal? (matchFilter 
                "Java"
                '((Test-First Java Concurrency for the Classroom)
                 ((Mathias Ricken)(Robert Cartwright))
                 ("CS education" "Java" "JUnit" "unit testing" "concurrent programming"
                  "tools" "software engineering"))
                '())
              '(((Test-First Java Concurrency for the Classroom)
               ((Mathias Ricken)(Robert Cartwright))
               ("CS education" "Java" "JUnit" "unit testing" "concurrent programming"
                  "tools" "software engineering")))
              "matchFilter failure for a single matching article")

(check-equal? (matchFilter
                "Nothing"
                '((Test-First Java Concurrency for the Classroom)
                  ((Mathias Ricken)(Robert Cartwright))
                  ("CS education" "Java" "JUnit" "unit testing" "concurrent programming"
                   "tools" "software engineering"))
                 '(((Killer "Killer Examples" for Design Patterns)
                    ((Carl Alphonce) (Michael Caspersen) (Adrienne Decker))
                    ("Object-orientation" "Design Patterns"))))
              '(((Killer "Killer Examples" for Design Patterns)
                 ((Carl Alphonce) (Michael Caspersen) (Adrienne Decker))
                 ("Object-orientation" "Design Patterns")))
              "matchFilter failure for when no match and exisiting elements in list")




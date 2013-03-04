#!/usr/bin/env racket
#lang racket

; MAIN FUNCTION
(provide keywordSearch)
(define (keywordSearch keyword articles )
  (map getTitle (makeListMatching (createFilter keyword) articles)))

(provide createFilter)
(define (createFilter keyword)
  (curry matchFilter keyword))

(provide makeListMatching)
(define (makeListMatching filterFunction articles)
  (foldl filterFunction  '() articles ))

(provide matchFilter)
(define (matchFilter keyword paper other_papers)
  (if (containsKeyword keyword paper) (list* paper other_papers) other_papers))

; ACCESSOR FUNCTIONS
(provide getTitle)
(define (getTitle lst)
  (first lst))

(provide getAuthors)
(define (getAuthors lst)
  (first (rest lst)))

(provide getKeywords)
(define (getKeywords lst)
  (first (rest (rest lst))))


; HELPER FUNCTIONS
; select title from list_of_papers, list_of_search_results where equal
(provide selectTitles)
(define (selectTitles list_of_papers list_of_search_results)
         1)
(provide containsKeyword)
(define (containsKeyword word paper)
         (member word (getKeywords paper)))


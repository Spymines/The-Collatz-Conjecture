#!/usr/bin/sbcl --script

;Trevor Mines
;CSC 330 
;Lisp recursive
;Collatz Project
;Fall 2020


;Function that sorts the first aray input and does the same swaps on the second
;to keep them properly associated with each other
(defun sortIt (highestLen highestVals)
	(loop with sorted = nil until sorted do
		(setf sorted T)
		(dotimes (x 9) 
			(cond ((> (aref highestLen x) (aref highestLen (+ x 1)))
				(rotatef (aref highestLen x) (aref highestLen(+ x 1)))
				(rotatef (aref highestVals x) (aref highestVals(+ x 1)))
				(setf sorted T))
			)
		)
	)
)

;Recursive function to find the collatz sequence length
(defun collatzIt(num)
	(cond ((= num 1)
		(return-from collatzIt 0))
		((= (mod num 2) 0)
		(return-from collatzIt (+ 1 (collatzIt (/ num 2)))))
		(T
		(return-from collatzIt (+ 1 (collatzIt(+ (* num 3) 1)))))
	)
)

;Search to check for duplicates
(defun searchArray (a value)
        (dotimes(x 9)
        	(if (= (aref a x) value)
                	(return-from searchArray T))
        )
        (return-from searchArray nil)
)



(defvar j)
(defvar i 0)
(defvar ic)
(defvar highestLen)
(setf highestLen (make-array '(10)))
(defvar highestVals)
(defvar highestVals (make-array '(10)))

;Sets all initial values in the arrays to 0
(loop for j from 0 to 9
	do
	(setf (aref highestLen j) 0)
	(setf (aref highestVals j) 0) 
)

;Loops through each number that needs to be tested
(loop for j from 2 to 5000000000
	do
	(setq i j)

	;Call to the recursive collatz function to get the ic
	(setq ic (collatzIt i))

	;Adds the ic to the lowest position in the highestLen array if
	;it is larger than the smallest value and not a duplicate length.
	;Also adds the value to the highestVals array and sorts
	(cond ((> ic (aref highestLen 0)) 
		(cond ((not (searchArray highestLen ic))
		(setf (aref highestLen 0) ic)
		(setf (aref highestVals 0) j)
		(sortIt highestLen highestVals))))	
	)
)

;Prints the output in the specified format, first by length then by value
(format t "Sorted based on ascending length:~%")
(loop for j from 0 to 9
	do
	(format t "A starting value of ~A has ~A steps.~%" (aref highestVals j) (aref highestLen j))
)

(sortIt highestVals highestLen)
(format t "~%Sorted based on ascending value:~%")
(loop for j from 0 to 9
        do
        (format t "A starting value of ~A has ~A steps.~%" (aref highestVals j) (aref highestLen j))
)



(terpri)

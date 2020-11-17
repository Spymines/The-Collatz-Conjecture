program collatz

integer ::  ic, counter
integer (8) :: j,i,temp
integer (8), dimension(10):: largestVal

interface
        SUBROUTINE Bubble_Sort(a)
                Integer(8), INTENT(in out), DIMENSION(:) :: a
                Integer(8) :: temp
                INTEGER :: i, j
                LOGICAL :: swapped
        end subroutine Bubble_Sort
end interface






counter = 1
do while (counter <= 10)
        largestVal(counter) = 0_8
        counter = counter + 1
end do 

temp = 5000000000_8
j = 2_8
do while (j < temp)

i = j
ic=0
do while ( i /= 1 )  
        if ( mod(i,2) == 0 ) then  ! If even divide by 2
                i = i / 2
        else
                i = i * 3 + 1            ! If odd multiply by 3 and add 1
        endif
                ic = ic + 1                ! Increment counter
   
enddo 


if(ic > largestVal(1)) then
        largestVal(1) = ic
        Call Bubble_Sort(largestVal)
endif

!print *, "A starting value of ", j, " has ", ic, " steps."

j = j + 1
enddo

print*, largestVal(1:10)

end program collatz

SUBROUTINE Bubble_Sort(a)
  Integer(8), INTENT(in out), DIMENSION(:) :: a
  Integer(8) :: temp
  INTEGER :: i, j
  LOGICAL :: swapped
 
  DO j = SIZE(a)-1, 1, -1
    swapped = .FALSE.
    DO i = 1, j
      IF (a(i) > a(i+1)) THEN
        temp = a(i)
        a(i) = a(i+1)
        a(i+1) = temp
        swapped = .TRUE.
      END IF
    END DO
    IF (.NOT. swapped) EXIT
  END DO
END SUBROUTINE Bubble_Sort

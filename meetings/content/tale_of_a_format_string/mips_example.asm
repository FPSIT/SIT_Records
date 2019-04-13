# **************************************************************************** #
#                                                                              #
#                                                             |\               #
#    prime_finder.mips                                  ------| \----          #
#                                                       |    \`  \  |  p       #
#    By: cshepard6055 <cshepard6055@floridapoly.edu>    |  \`-\   \ |  o       #
#                                                       |---\  \   `|  l       #
#    Created: 2019/02/19 12:42:13 by cshepard6055       | ` .\  \   |  y       #
#    Updated: 2019/02/21 11:09:31 by cshepard6055       -------------          #
#                                                                              #
# **************************************************************************** #

# accept two numbers A and B from a user and print primes from A to B inclusive

.data # define prompts

input_a_prompt: .asciiz   "Enter a number A: "
input_b_prompt: .asciiz "\nEnter a number B: "
done_prompt:    .asciiz "\nProgram finished."

no_prime_nums:  .asciiz "\nNo prime number between numbers A and B"
prime_n_found:  .asciiz  " is prime.\n"
one_is_prime:   .asciiz "\n1 is a prime number."

equality_error: .asciiz   "B is less than A!"
newline:        .asciiz "\n"




.text # begin program

# print prompt asking for A
li $v0, 4
la $a0, input_a_prompt
syscall
# input A to register $s0
li $v0, 5
syscall
move $s0, $v0

# print prompt asking for B
li $v0, 4
la $a0, input_b_prompt
syscall
# input B to register $s1
li $v0, 5
syscall
move $s1, $v0

# If B < A throw an error
slt $t0, $s1, $s0
beq $t0, 1, error_b_less_than_a

# Set prime_found in $s2 to false
addi $s2, $0, 0


# Main logic of the program
#lower_bound = $s0          int lower_bound = A
addi $t1, $s1, 0          # int upper_bound = B
addi $t5, $0,  1
addi $t1, $t1, 1          # int upper_bound = B+1-1     Hack edge case fix

loop:
    # check if i is prime first
    # i = upper_bound

    beq  $s0, $t1, output # if our upper bound = A then we exit
    addi $t1, $t1, -1     # decrement upper bound; this causes edge case issues
    addi $t0, $t1,  0     # set i = new upper bound
    addi $t0, $t0, -1     # set i = new upper bound - 1
    addi $t5, $0,   0     # reset our prime found flag to true
    j prime_check_loop
    
    j loop


prime_check_loop:
    # if you're at the limit, exit if upper_bound == lower_bound
    addi $t4, $0, 1
    beq $t0, $t4, prime_found # exit i == 1

    # Take the modulus
    # $t3 = $t1 % $t0           mod = upper_bound % i
    div $t1, $t0
    mfhi $t3

    beq $t3, $0, not_prime

    # jump back to main loop on a divisible combination
    addi $t0, $t0, -1         # decrement i
    j prime_check_loop


not_prime:
    addi $t5, $0, 1
    j loop


prime_found:
    addi $s2, $0, 1
    # print that $t1 is prime, our upper bound
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, prime_n_found
    syscall

    j loop


no_primes_found:
    li $v0, 4
    la $a0, no_prime_nums
    syscall
    j exit


output:
    # if A == 1, make sure to print that it is a prime
    addi $t4, $0, 1
    bne $s0, $t4, continue_output
    li $v0, 4
    la $a0, one_is_prime
    syscall

    continue_output:

    beq $s2, 1, done # If primes were found, exit

    # otherwise no primes were found; let the user know
    li $v0, 4
    la $a0, no_prime_nums
    syscall

    j exit


error_b_less_than_a:
    li $v0, 4
    la $a0, equality_error
    syscall

    j exit


exit:
    li $v0, 4
    la $a0, done_prompt
    syscall

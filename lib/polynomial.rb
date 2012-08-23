#  polynomial.rb
#  Polynomial
# == Synopsis
# Converts a polynomial provided as an array  of it's coefficients to
# a pretty-print of the polynomial - [An, An-1, ...] =>  An(x^n) + An-1(x^n-1)+...
# == Author
#  Fred Fordham on 01/12/2009.
# == Usage
#  puts Polynomial.new([-3,-4,1,0,6]) # => -3x^4-4x^3+x^2+6
#  puts Polynomial.new([1,0,2]) # => x^2+2
 
class Polynomial
  
  VAR = 'x'
  
  def initialize(coefficients)
      if coefficients.nitems > 1
        @polynomial = coefficients
      else 
        raise ArgumentError, "Need at least 2 coefficients", caller
      end
  end
  
 
  # Pretty-prints instance variable @polynomial array        
    def to_s 
    term_nbr = 0                              # initialize variables
    polynomial_pp= ''
    term = ''
    @polynomial.each do |coefficient|         
      term_nbr += 1                           # increment term number counter
      term=''                                 # initialize next term
      degree = @polynomial.nitems - term_nbr  # decrement degree of next term
      unless  coefficient == 0                # if a coefficient is 0, nothing gets added to the output
        term << get_term(coefficient, term_nbr, degree)
      end
      polynomial_pp << term
    end
    if polynomial_pp == ''                    # if polynomial is 0
      return  polynomial_pp = '0'                  
    else
      return polynomial_pp                    # return formated polynomial
    end
  end

  private                                     # Polynomial private instance methods
  
  # get_term(coefficient, term_nbr, degree) -> str
  #
  # Returns formated term of polynomial with sign. 
  #
  # Method parameters:
  # * 'coefficient' is coefficient part of polynomial's term
  # * 'term_nbr'  identifies the particular term of the polynomial  
  # * 'degree' is the value of the term's variable exponent   
  # Rules: 
  # * if coefficient of term is 1 it doesn't get printed only the signed variable is returned eg. -x^2 ;                       
  # * the "+" sign is returned for a positive coefficient unless it's the first term; and                         
  # * for x^1 the ^1 part gets omitted; and if x^0 == 1, so we don't need to display it.                   
    def get_term(coefficient, term_nbr, degree)
      term = ''
      if coefficient.abs == 1 
          term << get_sign(coefficient)
          term.delete!('+') if term_nbr == 1 
      else
          term <<  get_sign(coefficient) << coefficient.abs.to_s
          term.delete!('+') if term_nbr == 1        
      end 
      if degree == 1                      # for x^1 the ^1 part gets omitted
        term << VAR
      elsif degree > 1                    # x^0 == 1, so we don't need to display it
        term << "#{VAR}^#{degree.to_s}"
      end       
      return term
    end
    
  # get_sign(coefficient) -> str
  #
  # Tests whether method parameter 'coefficient' is positive or negative. 
  #
  # Returns '+' for a positive and '-' for negative number.
   def get_sign(coefficient)
    if coefficient < 0
      '-'
    else 
      '+' 
    end
  end
    
end



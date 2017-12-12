#case relies on === being defined for the supplied condition.
#=== is defined in Proc class to issue Proc#call with the right-hand side argument of === as an argument
#this allows for procs to be used in case statements:
def even_or_odd(number)
  case number
  when ->(n) { n.even? }
    'even'
  when ->(n) { n.odd? }
    'odd'
  end
end



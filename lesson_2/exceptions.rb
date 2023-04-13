def validate_age(age)
  raise("invalid age") unless (0..105).include?(age)
end

age = 5

begin
  validate_age(age)
rescue RuntimeError => e
  puts e.message              #=> "invalid age"
end
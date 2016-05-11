(1..10).each do |i|
  user = User.create(name: "Name #{i}", email: "email#{i}@example.com", password: "a")
end

puts "Users created"
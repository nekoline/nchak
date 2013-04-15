%w(alpha beta gamma).each do |name|
  user = User.create(
    :email => "#{name}@example.com",
    :password => "#{name}...",
    :password_confirmation => "#{name}..."
  )
  user.confirm!
end
array = ["alpha", "beta", "gamma"]

array.each do |name|
  user = User.create(
    :email => "#{name}@example.com",
    :password => "#{name}...",
    :password_confirmation => "#{name}...",
    :confirmation_token => "#{name}...",
    :unconfirmed_email => "#{name}@example.com"
  )
  user.confirm!
end
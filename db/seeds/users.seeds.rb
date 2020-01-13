AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

User.create(
  first_name: 'Jack',
  last_name: 'Timmins',
  username: 'tim_jackins',
  email: 'jack@mail.com',
  password: 'password',
  password_confirmation: 'password'
) if Rails.env.development?

# Campaign Manager

> Your one-stop-shop for API driven dungeons and dragons campaigns!

## init

Install gems

```bash
bundle install
```

Build and seed database (requires an internet connection)

```bash
rails db:migrate
rails db:seed
```

Run app

```bash
rails server
```

## Debug

`rdebug-ide --host 127.0.0.1 --port 1234 --dispatcher-port 26162 bin/rails server`

## Handy Commands

`tail -f /usr/local/var/mysql/*.err &`

`jobs`

`kill %1`

`htmlbeautifier app/views/layouts/application.html.erb`

# README

#### Description

The main goal of this project is built a *API* following *TDD* methodology principles.

- Add a test
- Run all tests and fails
- Write code
- Run tests
- Refactor
- Repeat

Users have posts.

#### Resources

- Ruby version 2.5.0

- [Rspec](https://github.com/rspec/rspec-rails)

- [Factory_bot](https://github.com/thoughtbot/factory_bot)

- [Database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)

- [Faker](https://github.com/faker-ruby/faker)

- [Shoulda_matchers](https://github.com/thoughtbot/shoulda-matchers)

#### Comands && Requeriments

- Install gems

```shellscript
    bundle install
```

- Runing Rspec

```shellscript
    bundle exec rspec
```

- BDD

```shellscript
    rake db:create
```
```shellscript
    rake db:migrate
```

- If want test FactoryBot by console

```shellscript
    RAILS_ENV=test rails c
```
```shellscript
    FactoryBot.build(:post)
```

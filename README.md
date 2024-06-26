# Mailer Mount

Mailer Mount is a mountable Rails engine to add the following functionality to your application:

* A single purpose page for users to opt in / out of email preferences

See roadmap (below) for ideas about future development.

Specifically, the gem:

* Provide models to track email preferences
* Allow users to modify email preferences via URLs with a magic token, so this links can be used without users signing in and can be referenced in emails (ie. as Unsubscribe links)

## Installation
Add this line to your application's Gemfile:

```ruby
gem "mailer_mount"
```

And then execute:
```bash
$ bin/rails generate mailer_mount:install
```

Run the record-tracking migrations:

```bash
$ bin/rails db:migrate
```

Running this generator will do three things:

* Create a configuration file at config/mailer_mount.yml. This file is used to define the various email lists you are operating. See below for details on configuration.
* Create a MailerMount::EmailPreference model to track opt-ins from users
* Create a MailerMount::MagicToken model to allow users to access the email preference page

## Usage

In your User model (or whichever model you want to associate with having email preferences):

```ruby
class User < ApplicationRecord
  include MailerMount::Owner
end
```

To generate links that users can

## Roadmap

* Have an API endpoint to query a particular user's email preference for internal usage
* Provide a way to manage a Rails application's email templates with a user interface
* Send broadcasts to users and subset of users from within Rails

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

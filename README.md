# The Timekit Ruby Gem

[![Gem Version](https://badge.fury.io/rb/timekit.svg)](https://badge.fury.io/rb/timekit)
[![Build Status](http://img.shields.io/travis/mgauthier/timekit.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/mgauthier/timekit.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/mgauthier/timekit.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/mgauthier/timekit.svg)][coveralls]
[![Inline docs](http://inch-ci.org/github/mgauthier/timekit.svg?branch=master)](http://inch-ci.org/github/mgauthier/timekit)

[gem]: https://rubygems.org/gems/timekit
[travis]: https://travis-ci.org/mgauthier/timekit
[gemnasium]: https://gemnasium.com/mgauthier/timekit
[codeclimate]: https://codeclimate.com/github/mgauthier/timekit
[coveralls]: https://coveralls.io/r/mgauthier/timekit
[inchpages]: http://inch-ci.org/github/mgauthier/timekit

A Ruby interface to the Timekit API.

## Installation

    gem install timekit

## Configuration

Configure the Timekit client before using it

```ruby
Timekit.configure(
  server_key: 'api_key_...',
  client_key: 'widget_key_...',
)
```

## Documentation

[http://developers.timekit.io/docs]

## Usage Examples

After configuring Timekit you can initialize a `client`,
and then you can do the following.

### Apps

**Initialize your client**

```ruby
client = Timekit.app_client
```

**List**

```ruby
client.list
```

**Create**

```ruby
client.create('app-name')
```

**Update**

```ruby
client.update('app-slug')
```

**Delete**

```ruby
client.delete('app-slug')
```

### Bookings

**Initialize your client**

```ruby
client = Timekit.booking_client
```

**List**

```ruby
client.list
```

**Show**

```ruby
client.show('booking-id')
```

**Create**

```ruby
client.create(
  'booking-graph-type', # 'confirm-decline'
  {
    start: 'start-date',
    end: 'end-date',
    what: 'booking-title',
    where: 'booking-address',
    calendar_id: 'replace-with-id',
    description: 'booking-description'
  },
  {
    name: 'booking-customer-name',
    email: 'booking-customer-email',
    phone: 'booking-customer-phone',
    voip: 'booking-customer-voip',
    timezone: 'booking-timezone'
  },
  'booking-action', # 'create'
}
```

**Update**

```ruby
client.update('booking-id', 'confirm')
```

### Calendars

**Initialize your client**

```ruby
client = Timekit.calendar_client
```

**List**

```ruby
client.list
```

**Show**

```ruby
client.show('calendar-id')
```

**Create**

```ruby
client.create(
  'calendar-name',
  'calendar-description',
  'calendar-backgroundcolor',
  'calendar-foregroundcolor'
}
```

**Update**
Not yet implemented

**Delete**

```ruby
client.delete('calendar-id')
```

### Credentials

**Initialize your client**

```ruby
client = Timekit.credential_client
```

**List**

```ruby
client.list
```

**Create**

```ruby
client.create(
  'credential-type',
  'credential-scope',
  'credential-description',
  'credential-referrer',
  'credential-expires',
)
```

**Delete**

```ruby
client.delete('credential-id')
```

### Events

**Initialize your client**

```ruby
client = Timekit.event_client
```

**List**

```ruby
client.list(
  'start-time',
  'end-time'
)
```

**Show**

```ruby
client.show('event-id')
```

**Create**

```ruby
client.create(
  'event-start',
  'event-end',
  'what',
  'where',
  'calendar_id',
  'participants',
  'invite',
  'description',
  'sync_provider',
  'my_rsvp',
  'all_day'
)
```

**Update**

```ruby
client.update(
  'event-id',
  'event-start',
  'event-end',
  'what',
  'where',
  'participants',
  'all_day'
)
```

**Delete**

```ruby
client.delete('event-id')
```

### Findtime

**Initialize your client**

```ruby
client = Timekit.findtime_client
```

### User

**Initialize your client**

```ruby
client = Timekit.user_client
```

**Me**

```ruby
client.me
```

**Timezone**

```ruby
client.timezone('user-email')
```

**Update**

```ruby
client.update(
  'user-first_name',
  'user-last_name',
  'user-timezone',
  'user-password'
)
```

**Reset Password**

```ruby
client.reset_password('user-email')
```

### Widget

**Initialize your client**

```ruby
client = Timekit.widget_client
```

**List**

```ruby
client.list
```

**Embed**

```ruby
client.embed('widget-id')
```

**Hosted**

```ruby
client.hosted('widget-id')
```

**Create**

```ruby
client.create(
  'widget-config',
  'widget-name',
  'widget-slug',
)
```

**Update**

```ruby
client.update(
  'widget-id',
  'widget-config',
  'widget-name',
  'widget-slug',
)
```

**Delete**

```ruby
client.delete('widget-id')
```

## Supported Ruby Versions

This library aims to support and is [tested against][travis] the following Ruby
versions:

- Ruby 2.1
- Ruby 2.2
- Ruby 2.3

If something doesn't work on one of these versions, it's a bug.

This library may inadvertently work (or seem to work) on other Ruby versions,
however support will only be provided for the versions listed above.

If you would like this library to support another Ruby version or
implementation, you may volunteer to be a maintainer. Being a maintainer
entails making sure all tests run and pass on that implementation. When
something breaks on your implementation, you will be responsible for providing
patches in a timely fashion. If critical issues for a particular implementation
exist at the time of a major release, support for that Ruby version may be
dropped.

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver]. Violations
of this scheme should be reported as bugs. Specifically, if a minor or patch
version is released that breaks backward compatibility, that version should be
immediately yanked and/or a new version should be immediately released that
restores compatibility. Breaking changes to the public API will only be
introduced with new major versions. As a result of this policy, you can (and
should) specify a dependency on this gem using the [Pessimistic Version
Constraint][pvc] with two digits of precision. For example:

    spec.add_dependency 'timekit', '~> 1.0'

[semver]: http://semver.org/
[pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint

## Copyright

Copyright (c) 20016-2016 Michael Gauthier
See [LICENSE][] for details.

[license]: LICENSE.md

# update_if_changed

Ruby on Rails' [`ActiveRecord#update`](http://apidock.com/rails/ActiveRecord/Persistence/update), but only when needed.

```ruby
foo = Foo.create(bar: "this is a test")
```

`ActiveRecord#update` runs transaction callbacks, even when nothing was updated:

```ruby
foo.update(bar: "this is a test")
   (0.1ms)  begin transaction
   (0.1ms)  commit transaction
# => true
```

`ActiveRecord#update_if_changed` avoid calling `ActiveRecord#update` when possible:

```ruby
foo.update_if_changed(bar: "this is a test")
# => nil
```

Other than that, it just calls `ActiveRecord#update` like you would expect:

```ruby
foo.update_if_changed(bar: "it worked!")
   (0.1ms)  begin transaction
  SQL (0.4ms)  UPDATE "foos" SET "bar" = ?, "updated_at" = ? WHERE "foos"."id" = ?  [["bar", "it worked!"], ["updated_at", "2015-02-03 18:35:18.887834"], ["id", 1]]
   (2.1ms)  commit transaction
# => true
```

Time to go crazy:

```ruby
gem 'update_if_changed', '~> 0.0.1'
```

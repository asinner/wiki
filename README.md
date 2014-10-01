# README
## Approach
This app involves two resources:
`users` & `pages`
Populate the wiki site with pages using `rake db:seed`. Sample pages are located in the `seeds.rb` file.
After this you can view pages if you sign up and sign in as a `user`.
Users can then visit pages and edit those pages. If a user edits a page, they are listed as a contributor
on the page, and that contribution is reflected as a link on the users page.
This application involved declaring `has_many_and_belongs_to :model` in the `user.rb` and `page.rb` files.
This allowed me to use statements such as:
```ruby
@page = Page.find(params[:id])
@page.users
```
However, it looked better to call `@page.contributors` so I did the following in `page.rb`
```ruby
has_many_and_belongs_to :contributors, -> { uniq }, class_name: 'User'
```
This did several things. First this uses a join table to find the associated records. So I had to create a pages_users table in the db. Then I declared `-> { uniq }` to only return unique records (in the case that a user makes multiple contributions to a page). Next I declared the class_name to be 'User' so that rails knows to look for `user_id` in the db instead of `contributor_id`.
I also applied this step to the `user.rb` file.
## Post-exercise Questions / Assumptions

These are some of the questions that popped in my head while executing the task, along with some of the assumptions I made. Click on a question to expand it and see my thoughts (i.e. the hypothetical answer I might have expected from a colleague).

<details>
  <summary>Why are we building this?</summary>

  Somewhat a bizarre question, as actual the answer is obviously "It's just a tech task". But if we were to pretend that this was a serious project built for customers, then this is actually an obvious question to make, and the answer might be "because we need a better way of tracking our countless projects".

  Note that, considering the document says to "take the approach you would normally take in order to build the right product for the company", I've assumed that this was a serious project, internal to the company, and the rest of the questions/answers reflect this.
</details>

<details>
  <summary>What's the problem we're trying to solve?</summary>

  This question simply tries to dig more deeply into the requirements. Again, whilst the actual answer might very well be that "it's just a simple tech test and there's no real problem to solve", if I had to pretend that I was building a serious project, I would definitely ask such question, and hopefully start a productive conversation with the stakeholders in order to gather requirements and improve my understanding of the product.
</details>

<details>
  <summary>Who's the target persona?</summary>

  A follow-up question to the above, simply trying to understand who the ideal user would be. In a real-world scenario it would be important to know this, in order to build the right product. A hypothetical answer from a colleague might be: "it's for internal use, so anyone in the company could use it, but in particular it's for our team to track changes to the projects we work on".
</details>

<details>
  <summary>Should I replicate the same tech stack from the "About Us"?</summary>

  Since there's a link to the tech stack highlighting tools and principles, and had I been a colleague myself, I would have assumed that we wanted to follow these as closely as possible, for consistency. However, with this being a simple tech test (i.e. not actually a real project) on which I shouldn't spend more than 3 hours, I thought it would also be fair to assume the contrary, to an extent. The task clearly says to "Use Ruby on Rails", but it says nothing else in terms of tech stack, so for the sake of simplicity and speed I decided to stick with the Rails defaults for the most part (e.g. ERB over Slim, Minitest over RSpec, no JS or Turbo, and no linter/formatter other than the one living in my editor), but I did add Tailwind and ViewComponent because I'm familiar with them and I thought it would be beneficial to include them.
</details>

<details>
  <summary>What would the ER diagram look like?</summary>

  Hypothetical answer: There are many ways to approach this, but don't make it any more complicated than it has to be. Entities could simply be:

  - User
  - Project
  - Comment

  In terms of relationship, a Project has many Comments, but one Comment belongs to one Project and one Project only (N:1). Same between a User and a Comment: a user can make many Comments, but one Comment belongs to a particular User only (N:1). One pic is worth a thousand words, so here's the diagram:

  ![](INSERT_PIC_HERE)

</details>

<details>
  <summary>What are the possible statuses of a project?</summary>

  For simplicity assume just "Not started", "In progress", and "Done".

  In a real-world scenario there could be many more, and one would ideally have a state machine handling all the possible state transitions, but for the sake of simplicity I'd just go for the above.
</details>

<details>
  <summary>Is there a default project status?</summary>

  Assume a project is "Not started" by default.

  Note: I've made it an enum:

  https://github.com/simonewebdesign/homeyapp/blob/d444e2cc87ec3c155ebbc103ac3581ff77b26187/app/models/project.rb#L6C1-L9C2

  This also avoids the weird edge case of a project having `nil` status (and the extra code necessary to support this case).
</details>

<details>
  <summary>Do we need user authentication?</summary>

  Yes. Most respectable SaaS apps have it, and nowadays it's pretty simple to do with `rails generate authentication`.

  Therefore a possible answer could be to just use the default Rails generator and improve the resulting `User` model by adding any other necessary attribute.
</details>

<details>
  <summary>What's the main user flow (i.e. the "happy path")?</summary>

  A classic UX would be, right after authentication, to see a nice dashboard with a bunch of data in it. For this simple exercise don't build a dashboard, but:

  ### If there are any "active" projects (i.e. projects that have "in_progress" status):

  Redirect to the **most recent** one.

  ### If there are no "active" projects:

  Redirect to the first project you can find.

  ### If there are no projects:

  Redirect to the project creation form.
</details>

<details>
  <summary>Do we want to the project name/title be editable inline?</summary>

  That's a nice improvement we could easily add, using Turbo it's really easy to make an Ajax request that simply updates the model without refreshing the page. However I wouldn't bother with this for now, just focus on scaffolding the controllers and views and let's improve it after. Ideally, the app should work out of the box and we can always sprinkle some JavaScript later for a snappier UX.
</details>



## README / Getting started

If you wish to get this application up and running locally, you'll need:

* Ruby
* PostgreSQL

Run the usual commands to get Rails working:

```
bundle # install the dependencies
bundle exec rails db:create db:migrate db:seed
bundle exec rails server
```

Run the test suite:

```
rails test
```

## Post-exercise Questions / Assumptions

These are some of the questions that popped in my head while executing the task, along with some of the assumptions I made. Click on a question to expand it and see my thoughts (i.e. the hypothetical answer I might have expected from a colleague).

<details>
  <summary><strong>Why are we building this?</strong></summary>

  It might seem like a strange question, since the obvious answer is, "It's just a tech task." But if we were to treat this as a real project for customers, the question actually makes sense, and the answer could be something like, "We need a better way to track our many projects."

  The instructions say to "take the approach you would normally take to build the right product for the company". For the sake of simplicity, I’ve assumed this is an internal project, and the rest of my approach and answers reflect that assumption.
</details>

<details>
  <summary><strong>What's the problem we're trying to solve?</strong></summary>

  This question is really about getting a deeper understanding of the requirements. While the answer might simply be that "it's just a basic tech test with no real problem to solve," if I were working on a serious project, I'd definitely ask questions like this. It would help spark a productive conversation with stakeholders, allowing me to gather requirements and get a clearer understanding of the product.
</details>

<details>
  <summary><strong>Who's the target persona?</strong></summary>

  A follow-up question to the above, simply trying to understand who the ideal user would be. In a real-world scenario it would be important to know this, in order to build the right product. A hypothetical answer from a colleague might be: "it's for internal use, so anyone in the company could use it, but in particular it's for our team to track changes to the projects we work on".
</details>

<details>
  <summary><strong>Should I replicate the same tech stack from the "About Us"?</strong></summary>

  Since I received a link outlining the tech stack and the guiding principles, if I were a colleague, I would have assumed the goal was to adhere to those principles as closely as possible for consistency. However, given that this is a tech test (and not a full-fledged project) with a suggested time limit of 3 hours, I thought it was reasonable to assume I didn't need to fully replicate the exact tech stack—at least not in every detail.

  The task explicitly asks to "Use Ruby on Rails," but doesn't specify anything further about the tech stack. So, for simplicity and efficiency, I opted to stick with Rails defaults (such as ERB instead of Slim, Minitest instead of RSpec, no JavaScript or Turbo, and no additional linters/formatters outside of what my editor provides). However, I did incorporate Tailwind and ViewComponent because I'm familiar with them and believed they would add value to the project.
</details>

<details>
  <summary><strong>What would the ER diagram look like?</strong></summary>

  Hypothetical answer: There are several ways to approach this, but let's keep it simple. The key entities could be:

  - User
  - Project
  - Comment

  In terms of relationships, a Project can have many Comments, but each Comment belongs to one and only one Project (N:1). Similarly, a User can create many Comments, but each Comment is associated with just one User (N:1). A picture is worth a thousand words, so here’s a diagram to illustrate:

  ![Entity Relationship Diagram](https://raw.githubusercontent.com/simonewebdesign/homeyapp/refs/heads/main/ER-diagram.png)

</details>

<details>
  <summary><strong>What are the possible statuses of a project?</strong></summary>

  For simplicity, let's assume the only states are "Not started," "In progress," and "Done."

  In a real-world scenario, there could be many more states, and ideally, a state machine would handle all the possible transitions. However, for the sake of simplicity, I’ll stick with the three mentioned above.
</details>

<details>
  <summary><strong>Is there a default project status?</strong></summary>

  Assume a project is "Not started" by default.

  Note: I've made it an enum:

  https://github.com/simonewebdesign/homeyapp/blob/d444e2cc87ec3c155ebbc103ac3581ff77b26187/app/models/project.rb#L6C1-L9C2

  This also avoids the weird edge case of a project having `nil` status (and the extra code necessary to support this case).
</details>

<details>
  <summary><strong>Do we need user authentication?</strong></summary>

  Yes. Most respectable SaaS apps have it, and nowadays it's pretty simple to do with `rails generate authentication`.

  Therefore a possible answer could be to just use the default Rails generator and improve the resulting `User` model by adding any other necessary attribute.
</details>

<details>
  <summary><strong>What's the main user flow (i.e. the "happy path")?</strong></summary>

  A typical UX would involve showing a nice dashboard with data immediately after authentication. For this simple exercise, however, you don’t need to build a full dashboard. Instead, please follow these acceptance criteria (in this exact order):

  ##### If there are any "active" projects (i.e., projects with an "in_progress" status):
  Redirect to the most recent one.

  ##### If there are no "active" projects:
  Redirect to the first available project you can find.

  ##### If there are no projects:
  Redirect to the project creation form.
</details>

<details>
  <summary><strong>Do we want to the project name/title be editable inline?</strong></summary>

  That’s a great improvement we could easily add. With Turbo, it's simple to make an Ajax request that updates the model without needing to refresh the page. However, I’d suggest we hold off on that for now. Let's focus on scaffolding the controllers and views first, and we can improve it later. Ideally, the app should work right out of the box (without any JavaScript), and we can always add some JS later to enhance the UX.
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

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
User.find_or_create_by!(email_address: "admin@example.com", display_name: "Admin") do |user|
  user.password = "Password123!"
end

ashley = User.find_or_create_by!(email_address: "ashley@example.com", display_name: "Ashley (Project Manager)") do |user|
  user.password = "Password123!"
end

simone = User.find_or_create_by!(email_address: "simone@example.com", display_name: "Simone (Developer)") do |user|
  user.password = "Password123!"
end

otis = User.find_or_create_by!(email_address: "otis@example.com", display_name: "Otis (CTO)") do |user|
  user.password = "Password123!"
end

andrea = User.find_or_create_by!(email_address: "andrea@example.com", display_name: "Andrea (Designer)") do |user|
  user.password = "Password123!"
end

romney = User.find_or_create_by!(email_address: "romney@example.com", display_name: "Romney (Lead Developer)") do |user|
  user.password = "Password123!"
end

# Create projects
project_conversation = Project.find_or_create_by!(name: "Project Conversation History") do |project|
  project.status = "not_started"
end

Project.find_or_create_by!(name: "Customer Portal Redesign") do |project|
  project.status = "in_progress"
end

Project.find_or_create_by!(name: "API Documentation") do |project|
  project.status = "done"
end

# Create a full conversation
Comment.create!(
  user: ashley,
  project: project_conversation,
  content: "Use Ruby on Rails to build a project conversation history. A user should be able to:\n\n• leave a comment\n• change the status of the project\n\nThe project conversation history should list comments and changes in status.\n\nPlease don't spend any more than 3 hours on this task.",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Hey Ashley, why are we building this? And where do these requirements come from?",
)

Comment.create!(
  user: ashley,
  project: project_conversation,
  content: "We wanted a quick tool we could use internally to track projects. You know, it's becoming a bit painful to handle so many projects at once.",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Why can't we just use Jira like everybody else?",
)

Comment.create!(
  user: otis,
  project: project_conversation,
  content: "I hate Jira, it's too complicated and I'd rather we spend an afternoon building a simple project conversation history app. You're talented, it shouldn't take you more than 3 hours anyway. Besides, we're tight on budget this year.",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Ah, I see. Well, in that case, I'm assuming we need user authentication as well?",
)

Comment.create!(
  user: ashley,
  project: project_conversation,
  content: "Yes, that's a great idea!",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Ok great—what about mockups? Do we have any?",
)

Comment.create!(
  user: ashley,
  project: project_conversation,
  content: "Yeah, Andrea has designed the whole thing from scratch.",
)

Comment.create!(
  user: andrea,
  project: project_conversation,
  content: "That's right.",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Cool. Andrea, can I see the Figma screen?",
)

Comment.create!(
  user: andrea,
  project: project_conversation,
  content: "Sure thing! Here it is: [link]",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Thank you. Looks great! I have some questions on this design, in particular I'm not sure that fancy dropdown thingy is doable in such a short time... perhaps we could take it out of the MVP? I think for now it'd be fine to use the regular dropdown component we already have in our component library.",
)

Comment.create!(
  user: ashley,
  project: project_conversation,
  content: "Good call. Let's put a ticket in the backlog.",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Great. I assume Romney has written an ADR about this project already?",
)

Comment.create!(
  user: romney,
  project: project_conversation,
  content: "Actually, I was wondering if you'd like to take the lead on this...",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Oh? How come?",
)

Comment.create!(
  user: romney,
  project: project_conversation,
  content: "I've got one too many things on my plate already and I thought this could be a good learning opportunity for you.",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Ah, that's totally fair! Happy to take the lead on this one. I'll write an ADR and ping you when it's ready for review.",
)

Comment.create!(
  user: romney,
  project: project_conversation,
  content: "Sounds good.",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Do we need an API for this?",
)

Comment.create!(
  user: romney,
  project: project_conversation,
  content: "No, not really. We'll just need a way to store the conversation history and a way to display it. We can use a simple Rails app for that.",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Oh also, quick question, do we want to use in the frontend? Should we go for the same stack we have in the main repo? Tailwind, Slim, View Components and the Turbo stuff, for consistency?",
)

Comment.create!(
  user: romney,
  project: project_conversation,
  content: "I think we keep it simple. No Slim, just plain ERB views. Let's not write any JavaScript if we can, and use Rails generators as much as you can, to save time. Just Follow the Rails Way™. I do like Tailwind though, so maybe keep that one.",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Got ya. What about the backend?",
)

Comment.create!(
  user: romney,
  project: project_conversation,
  content: "It's a simple Rails app, nothing fancy. I'd consider adding the Audited gem to track project status changes. Anyway, you're the expert here. Just remember KISS and YAGNI. And don't forget to add tests.",
)

Comment.create!(
  user: simone,
  project: project_conversation,
  content: "Alright. I think I got everything for now. I'll get started right away, but I'll make sure to add any additional questions on here. Watch this space!",
)

# Update project status to in_progress
project_conversation.update!(status: "in_progress")

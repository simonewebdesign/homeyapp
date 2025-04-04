class HomeController < ApplicationController
  def index
    active_project = Project.where(status: :in_progress).first || Project.first

    if active_project
      redirect_to project_path(active_project)
    else
      redirect_to new_project_path, notice: "No projects yet. Create your first project to get started!"
    end
  end
end

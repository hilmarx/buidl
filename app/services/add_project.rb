class AddProject
  def initialize(profile, url, github_type)
    @profile = profile
    @project_name = url.split('/')[-1]
    @github_username = url.split('/')[-2]
    @key = ENV['GITHUB_TOKEN']
    @github_type = github_type
  end


  def controller
    # Fetch all projects of the given user
    all_projects_url = "https://api.github.com/#{@github_type}/#{@github_username}/repos?access_token=#{@key}"
    projects_json = fetch_and_parse(all_projects_url)
    # Finding or creating the chosen project
    project = find_project(projects_json)
    # Getting the project languages of the project
    project_techs = fetch_and_parse("https://api.github.com/repos/#{@github_username}/#{@project_name}/languages?access_token=#{@key}")
    set_project_techs(project_techs, project)
    # Fetch commits of the selected project
    fetch_repo_commits(project)
  end

  def fetch_and_parse(url)
    data_serialized = open(url).read
    JSON.parse(data_serialized)
  end

  def find_project(projects_json)
    projects_json.each do |repo|
      if repo['name'] == project_name
        selected_repo = repo
        create_project(selected_repo)
      else
        # Raise an error
      end
    end
  end

  def create_project(repo)
    if Project.find(name: repo['name']).present?
      project = Project.find(name: repo['name'])
    else
      project = Project.new(
        name: repo['name'],
        private: repo['private'],
        github_description: repo['description'],
        primary_language: repo['language'],
        size_kilobytes: repo['size'],
        github_url: repo['html_url'],
        url: repo['homepage'],
        owner_id: repo['owner']['id'],
        github_id: repo['id']
      )
      project.save!
    end
  end

  def set_project_techs(techs, project)
    techs.each do |tech|
      lang = tech.first.downcase
      size_bytes = tech.last
      unless Technology.find_by(name: lang).nil?
        proj_tech = ProjectTechnology.new(project_id: project.id, technology_id: Technology.find_by(name: lang).id, size_bytes: size_bytes).save!
      end
    end
  end



  def fetch_repo_commits(project)
    api_url = "https://api.github.com/repos/#{@github_username}/#{project.name}/stats/contributors?access_token=#{@key}"
    repo_contributions_serialized = open(api_url).read
    if repo_contributions_serialized == ""
      # If API call retries an empty string, create empty contribution to link project to profile
      Contribution.new(profile_id: @profile.id, project_id: project.id).save!
    else
      repo_contributions = JSON.parse(repo_contributions_serialized)
      store_contribution_data(repo_contributions, project)
    end
  end



  def store_contribution_data(repo_contributions, project)
    repo = project
    # Loop over all contributions of a single repository
    repo_contributions.each do |contributions|
      if contributions['author']['login'] == @profile.name
        # Loop over all contrubutions of a single contributor
        contributions['weeks'].each do |contribution|
          lines_added = contribution['a'].to_i
          lines_deleted = contribution['d'].to_i
          commits = contribution['c'].to_i
          datetime = Time.at(contribution['w']).to_datetime
          # Call Create function
          create_contributions(lines_added, lines_deleted, commits, repo, datetime)
        end
      end
    end
  end

end

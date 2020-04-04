# frozen_string_literal: true

class Rockstart::SimpleTheme::ScaffoldGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def install_scaffold_templates
    copy_file "index.html.erb", "lib/templates/erb/scaffold/index.html.erb"
    copy_file "show.html.erb", "lib/templates/erb/scaffold/show.html.erb"
    copy_file "edit.html.erb", "lib/templates/erb/scaffold/edit.html.erb"
  end
end

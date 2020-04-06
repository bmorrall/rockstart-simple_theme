# frozen_string_literal: true

class Rockstart::SimpleTheme::SimpleFormGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def install_simple_form
    gem "simple_form"

    Bundler.with_clean_env do
      run "bundle install"

      # Prepend simple_form templates to our source path
      spec = Bundler.load.specs.find { |s| s.name == "simple_form" }
      source_paths.append(File.join(spec.full_gem_path, "lib/generators/simple_form/templates"))
    end

    copy_file "_form.html.erb", "lib/templates/erb/scaffold/_form.html.erb"

    # Include files from simple_form:install
    template "config/initializers/simple_form.rb"
    directory "config/locales"
  end

  def add_tailwindcss_overrides
    copy_file "config/initializers/simple_form_rockstart.rb"
  end
end

# frozen_string_literal: true

class Rockstart::SimpleThemeGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def run_generators
    generate "rockstart:simple_theme:layout"
  end
end

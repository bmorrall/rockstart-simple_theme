# frozen_string_literal: true

class Rockstart::SimpleTheme::LayoutGenerator < Rails::Generators::Base
  include Rails::Generators::AppName

  source_root File.expand_path("templates", __dir__)

  class_option :variant, type: :string,
                         desc: "name of the custom variant of shared components",
                         default: "default"

  def add_shared_components
    copy_file "head.html.erb", "app/views/shared/_head.html.erb"
    copy_file "navbar.html.erb", "app/views/shared/_navbar_#{variant}.html.erb"
    copy_file "footer.html.erb", "app/views/shared/_footer_#{variant}.html.erb"
  end

  def add_application_view
    template "application.html.erb.tt", "app/views/layouts/application.html.erb"
  end

  private

  def variant
    options[:variant]
  end
end

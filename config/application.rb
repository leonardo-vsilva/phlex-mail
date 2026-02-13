require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PhlexMail
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Configure Lookbook/ViewComponent preview paths
    config.view_component.preview_paths ||= []
    config.view_component.preview_paths << Rails.root.join("test/components/previews")

    config.lookbook.ui_theme = "zinc"

    # Configure Lookbook Project
    config.lookbook.project_name = "PhlexMail" # custom project name
    config.lookbook.project_logo = "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-mailbox-icon lucide-mailbox\"><path d=\"M22 17a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V9.5C2 7 4 5 6.5 5H18c2.2 0 4 1.8 4 4v8Z\"/><polyline points=\"15,9 18,9 18,11\"/><path d=\"M6.5 5C9 5 11 7 11 9.5V17a2 2 0 0 1-2 2\"/><line x1=\"6\" x2=\"7\" y1=\"10\" y2=\"10\"/></svg>" # custom SVG logo
    config.lookbook.ui_favicon = {
      light: "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"12\" height=\"12\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-mailbox-icon lucide-mailbox\"><path d=\"M22 17a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V9.5C2 7 4 5 6.5 5H18c2.2 0 4 1.8 4 4v8Z\"/><polyline points=\"15,9 18,9 18,11\"/><path d=\"M6.5 5C9 5 11 7 11 9.5V17a2 2 0 0 1-2 2\"/><line x1=\"6\" x2=\"7\" y1=\"10\" y2=\"10\"/></svg>"
    }

    # # Configure Lookbook Previews
    config.lookbook.preview_nav_filter = false
    config.lookbook.preview_embeds.enabled = false
    config.lookbook.preview_display_options = {
      bg_color: "#fff",
      max_width: "50%"
    }
    config.lookbook.preview_inspector.drawer_panels = [ :source ]
    config.lookbook.preview_embeds.enabled = false

    # Configure Lookbook Display
    config.lookbook.preview_display_options = {
      bg_color: "#fff" # default bg_color value
    }
  end
end

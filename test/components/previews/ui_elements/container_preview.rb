require Rails.root.join("app/components/ui/containers/containers.rb")

module UiElements
  class ContainerPreview < ViewComponent::Preview
    # @label Default Container
    def default
      render(Components::UiElements::Container.new(width: 600)) do
        "This is content inside a container."
      end
    end

    # @label With Mobile Gutter
    def with_gutter
      render(Components::UiElements::Container.new(
        gutter_on_mobile: true,
        content: "This container has gutters on mobile screens."
      ))
    end

    # @label Custom Backgrounds
    def custom_colors
      render(Components::UiElements::Container.new(
        bg_color: "#e2e8f0",
        content_bg_color: "#f8fafc",
        content: "Container with custom background colors."
      ))
    end
  end
end

require Rails.root.join("app/components/ui/spacing/spacing.rb")

module UiElements
  class SpacingPreview < ViewComponent::Preview
    # @label Vertical Spacer
    def vertical(height: 40)
      render(Components::UiElements::Spacing.new(
        variant: :vertical,
        height: height
      ))
    end

    # @label Line Divider
    def line
      render(Components::UiElements::Spacing.new(
        variant: :line,
        margin_top: 32,
        margin_bottom: 32
      ))
    end

    # @label Title Divider
    def title(text: "Section Title")
      render(Components::UiElements::Spacing.new(
        variant: :title,
        title: text
      ))
    end

    # @label Icon Button Divider
    def icon_button
      render(Components::UiElements::Spacing.new(
        variant: :icon_button,
        title: "Connect App",
        icon_url: "https://d2264344waaff4.cloudfront.net/assets/email/slack.png",
        icon_alt: "Slack",
        button_text: "Connect",
        button_url: "#"
      ))
    end
  end
end

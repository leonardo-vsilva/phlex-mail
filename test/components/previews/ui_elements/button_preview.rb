require Rails.root.join("app/components/ui/buttons/buttons.rb")

module UiElements
  class ButtonPreview < ViewComponent::Preview
    # @label Primary Button
    # @param text text "Button Text"
    def default(text: "Primary Action")
      render(Components::UiElements::Button.new(
        variant: :primary,
        text: text
      ))
    end

    # @label Secondary Button
    def secondary
      render(Components::UiElements::Button.new(
        variant: :secondary,
        text: "Cancel",
        href: "#"
      ))
    end

    # @label Text Button
    def text_variant
      render(Components::UiElements::Button.new(
        variant: :text,
        text: "Read more",
        href: "#"
      ))
    end

    # @label With Icon
    def with_icon
      render(Components::UiElements::Button.new(
        variant: :primary,
        text: "Download",
        icon_url: "https://d2264344waaff4.cloudfront.net/assets/email/download.png",
        icon_alt: "Download icon"
      ))
    end

    # @label Sizes
    def sizes
      @xs_button = Components::UiElements::Button.new(size: :xs, text: "Extra Small")
      @sm_button = Components::UiElements::Button.new(size: :sm, text: "Small")
      @md_button = Components::UiElements::Button.new(size: :md, text: "Medium")
      @lg_button = Components::UiElements::Button.new(size: :lg, text: "Large")
      @xl_button = Components::UiElements::Button.new(size: :xl, text: "Extra Large")

      render_with_template
    end
  end
end

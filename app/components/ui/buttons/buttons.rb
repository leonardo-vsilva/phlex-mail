module Components
  module UiElements
    class Button < Phlex::HTML
      # Size configurations
      SIZES = {
        xs: { padding: "4px 8px", font_size: "12px", line_height: "16px", icon_width: 10 },
        sm: { padding: "8px 12px", font_size: "14px", line_height: "20px", icon_width: 12 },
        md: { padding: "10px 16px", font_size: "14px", line_height: "20px", icon_width: 14 },
        lg: { padding: "10px 20px", font_size: "16px", line_height: "24px", icon_width: 14 },
        xl: { padding: "12px 24px", font_size: "16px", line_height: "24px", icon_width: 16 }
      }.freeze

      def initialize(
        variant: :primary,
        size: :md,
        text: "Button",
        href: "https://example.com",
        icon_url: nil,
        icon_alt: "",
        bg_color: nil,
        text_color: nil,
        hover_color: nil,
        border_color: nil,
        border_radius: "8px",
        font_weight: "500"
      )
        @variant = variant
        @size = size
        @text = text
        @href = href
        @icon_url = icon_url
        @icon_alt = icon_alt
        @border_radius = border_radius
        @font_weight = font_weight

        # Set default colors based on variant
        set_variant_colors(bg_color, text_color, hover_color, border_color)

        # Get size configuration
        @size_config = SIZES[@size] || SIZES[:md]
      end

      def view_template
        render_button_style
        render_button
      end

      private

      def set_variant_colors(bg_color, text_color, hover_color, border_color)
        case @variant
        when :primary
          @bg_color = bg_color || "#171717"
          @text_color = text_color || "#f8fafc"
          @hover_color = hover_color || "#000000"
          @border_color = border_color || "transparent"
        when :secondary
          @bg_color = bg_color || "#fffffe"
          @text_color = text_color || "#4b5563"
          @hover_color = hover_color || "#f3f4f6"
          @border_color = border_color || "#d1d5db"
        when :text
          @bg_color = bg_color || "transparent"
          @text_color = text_color || "#171717"
          @hover_color = hover_color || "transparent"
          @border_color = border_color || "transparent"
        end
      end

      def render_button_style
        style do
          raw(<<~CSS.html_safe)
            .hover-button-#{@variant}:hover {
              background-color: #{@hover_color} !important;
            }
          CSS
        end
      end

      def render_button
        div do
          a(
            href: @href,
            style: button_styles,
            class: "hover-button-#{@variant}"
          ) do
            # MSO spacer before content
            comment { "[if mso]><i style=\"mso-font-width: 150%; mso-text-raise: 30px;\" hidden>&emsp;</i><![endif]" }

            if @icon_url
              render_button_with_icon
            else
              render_button_text
            end

            # MSO spacer after content
            comment { "[if mso]><i hidden style=\"mso-font-width: 150%;\">&emsp;&#8203;</i><![endif]" }
          end
        end
      end

      def render_button_text
        span(style: "mso-text-raise: 16px") { @text }
      end

      def render_button_with_icon
        # Icon
        whitespace
        span(style: "mso-text-raise: 14px") do
          img(
            src: @icon_url,
            width: @size_config[:icon_width],
            style: "max-width: 100%; vertical-align: baseline;",
            alt: @icon_alt
          )
        end
        whitespace

        # MSO spacer between icon and text
        comment { "[if mso]><i hidden style=\"mso-font-width: 30%;\">&emsp;&#8203;</i><![endif]" }
        whitespace

        # Text
        span(style: "mso-text-raise: 14px; margin-left: 8px;") { @text }
        whitespace
      end

      def button_styles
        styles = [
          "display: inline-block",
          "text-decoration: none",
          "font-weight: #{@font_weight}",
          "border-radius: #{@border_radius}",
          "background-color: #{@bg_color}",
          "padding: #{@size_config[:padding]}",
          "font-size: #{@size_config[:font_size]}",
          "line-height: #{@size_config[:line_height]}",
          "color: #{@text_color}"
        ]

        # Add border for secondary and text variants
        if @border_color != "transparent"
          styles << "border: 1px solid #{@border_color}"
        end

        # Add text-align for buttons without icons
        unless @icon_url
          styles << "text-align: center"
        end

        styles.join("; ") + ";"
      end
    end
  end
end

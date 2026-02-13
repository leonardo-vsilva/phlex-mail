module Components
  module UiElements
    class Spacing < Phlex::HTML
      def initialize(
        variant: :vertical,
        height: 20,
        title: nil,
        icon_url: nil,
        icon_alt: nil,
        icon_width: 32,
        button_text: nil,
        button_url: nil,
        bg_color: "#f1f5f9",
        content_bg_color: "#fffffe",
        divider_color: "#d1d5db",
        title_color: "#4b5563",
        button_bg_color: "#4f46e5",
        button_text_color: "#f8fafc",
        button_hover_color: "#4338ca",
        width: 600,
        margin_top: 24,
        margin_bottom: 24
      )
        @variant = variant
        @height = height
        @title = title
        @icon_url = icon_url
        @icon_alt = icon_alt
        @icon_width = icon_width
        @button_text = button_text
        @button_url = button_url
        @bg_color = bg_color
        @content_bg_color = content_bg_color
        @divider_color = divider_color
        @title_color = title_color
        @button_bg_color = button_bg_color
        @button_text_color = button_text_color
        @button_hover_color = button_hover_color
        @width = width
        @margin_top = margin_top
        @margin_bottom = margin_bottom
      end

      def view_template
        case @variant
        when :vertical
          render_vertical_spacer
        when :line
          render_line_divider
        when :title
          render_title_divider
        when :icon_button
          render_icon_button_divider
        end
      end

      private

      def render_vertical_spacer
        table(style: "background-color: #{@bg_color}; width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td { unsafe_raw "&zwj;" }
            td(style: "background-color: #{@content_bg_color}; width: #{@width}px; max-width: 100%;") do
              div(role: "separator", style: "line-height: #{@height}px") { unsafe_raw "&zwj;" }
            end
            td { unsafe_raw "&zwj;" }
          end
        end
      end

      def render_line_divider
        table(style: "background-color: #{@bg_color}; width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td { unsafe_raw "&zwj;" }
            td(style: "background-color: #{@content_bg_color}; width: #{@width}px; max-width: 100%;") do
              table(role: "separator", style: "width: 100%;", cellpadding: "0", cellspacing: "0") do
                tr do
                  td(style: "width: 24px") { unsafe_raw "&zwj;" }
                  td do
                    div(style: "height: 1px; line-height: 1px; background-color: #{@divider_color}; margin-top: #{@margin_top}px; margin-bottom: #{@margin_bottom}px;") do
                      unsafe_raw "&zwj;"
                    end
                  end
                  td(style: "width: 24px") { unsafe_raw "&zwj;" }
                end
              end
            end
            td { unsafe_raw "&zwj;" }
          end
        end
      end

      def render_title_divider
        table(role: "separator", style: "background-color: #{@bg_color}; width: 100%;", cellpadding: "0", cellspacing: "0") do
          tr do
            td { unsafe_raw "&zwj;" }
            td(style: "background-color: #{@content_bg_color}; width: #{@width}px; max-width: 100%;") do
              table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                tr do
                  td(style: "padding: 20px 24px;") do
                    table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                      tr do
                        td do
                          div(style: "margin: 0 12px 0 0; height: 1px; background-color: #{@divider_color}; line-height: 1px;") do
                            unsafe_raw "&zwj;"
                          end
                        end
                        td(style: "width: 96px; font-size: 16px; line-height: 24px; font-weight: 500; color: #{@title_color};") do
                          plain @title
                        end
                        td do
                          div(style: "margin: 0 0 0 12px; height: 1px; background-color: #{@divider_color}; line-height: 1px;") do
                            unsafe_raw "&zwj;"
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            td { unsafe_raw "&zwj;" }
          end
        end
      end

      def render_icon_button_divider
        style do
          unsafe_raw <<~CSS
            .hover-bg-indigo-700:hover {
              background-color: #{@button_hover_color} !important;
            }
          CSS
        end

        table(role: "separator", style: "background-color: #{@bg_color}; width: 100%;", cellpadding: "0", cellspacing: "0") do
          tr do
            td { unsafe_raw "&zwj;" }
            td(style: "background-color: #{@content_bg_color}; width: #{@width}px; max-width: 100%;") do
              table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                tr do
                  td(style: "padding: 20px 24px;") do
                    table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                      tr do
                        td(style: "width: #{@icon_width}px; font-size: 0;") do
                          img(src: @icon_url, width: @icon_width, alt: @icon_alt)
                        end
                        td do
                          div(style: "margin: 0 12px; height: 1px; background-color: #{@divider_color}; line-height: 1px;") do
                            unsafe_raw "&zwj;"
                          end
                        end
                        td(style: "width: 96px; font-size: 16px; line-height: 24px; font-weight: 500; color: #{@title_color};") do
                          div do
                            a(
                              href: @button_url,
                              style: "display: inline-block; text-align: center; text-decoration: none; border-radius: 8px; background-color: #{@button_bg_color}; padding: 6px 14px; font-size: 14px; line-height: 20px; font-weight: 500; color: #{@button_text_color};",
                              class: "hover-bg-indigo-700"
                            ) do
                              comment { "[if mso]><i style=\"mso-font-width: 150%; mso-text-raise: 30px;\" hidden>&emsp;</i><![endif]" }
                              span(style: "mso-text-raise: 16px") { @button_text }
                              comment { "[if mso]><i hidden style=\"mso-font-width: 150%;\">&emsp;&#8203;</i><![endif]" }
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            td { unsafe_raw "&zwj;" }
          end
        end
      end
    end
  end
end

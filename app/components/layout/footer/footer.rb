# frozen_string_literal: true

module Components
  module Layout
    class Footer < Phlex::HTML
      def initialize(
        copyright_text: nil,
        disclaimer_text: nil,
        help_center_url: nil,
        help_center_text: "central de ajuda",
        bg_color: "#f1f5f9",
        content_bg_color: "#fffffe",
        text_color: "#d1d5db"
      )
        @copyright_text = copyright_text
        @disclaimer_text = disclaimer_text
        @help_center_url = help_center_url
        @help_center_text = help_center_text
        @bg_color = bg_color
        @content_bg_color = content_bg_color
        @text_color = text_color
      end

      def view_template
        style do
          unsafe_raw <<~CSS
            .hover-no-underline:hover {
              text-decoration: none !important;
            }
          CSS
        end

        table(style: "background-color: #{@bg_color}; width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td { unsafe_raw "&zwj;" }
            td(style: "background-color: #{@content_bg_color}; width: 600px; max-width: 100%; padding-bottom: 24px;") do
              table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                tr do
                  td(style: "padding: 0 24px;") do
                    render_divider
                    render_footer_text
                  end
                end
              end
            end
            td { unsafe_raw "&zwj;" }
          end
        end
      end

      private

      def render_divider
        table(style: "background-color: #{@bg_color}; width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td { unsafe_raw "&zwj;" }
            td(style: "background-color: #{@content_bg_color}; width: 600px; max-width: 100%;") do
              table(role: "separator", style: "width: 100%;", cellpadding: "0", cellspacing: "0") do
                tr do
                  td(style: "width: 0px") { unsafe_raw "&zwj;" }
                  td do
                    div(style: "height: 1px; line-height: 1px; background-color: #d1d5db; margin-top: 24px; margin-bottom: 24px;") do
                      unsafe_raw "&zwj;"
                    end
                  end
                  td(style: "width: 0px") { unsafe_raw "&zwj;" }
                end
              end
            end
            td { unsafe_raw "&zwj;" }
          end
        end
      end

      def render_footer_text
        div do
          if @copyright_text
            p(style: "margin: 0 0 8px; font-size: 14px; line-height: 20px; color: #{@text_color};") do
              plain @copyright_text
            end
          end

          if @disclaimer_text
            p(style: "margin: 0; font-size: 14px; line-height: 20px; color: #{@text_color};") do
              plain @disclaimer_text

              if @help_center_url
                plain "Caso ainda tenha dúvidas, acesse nossa "
                a(href: @help_center_url, class: "hover-no-underline", style: "color: #{@text_color}; text-decoration: underline;") do
                  plain @help_center_text
                end
                plain "."
              end
            end
          end
        end
      end
    end
  end
end

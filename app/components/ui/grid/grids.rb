# frozen_string_literal: true

module Components
  module UiElements
    class Grid < Phlex::HTML
      def initialize(
        columns: 1,
        gap: 24,
        bg_color: "#f1f5f9",
        content_bg_color: "#fffffe",
        padding: "0 24px"
      )
        @columns = columns
        @gap = gap
        @bg_color = bg_color
        @content_bg_color = content_bg_color
        @padding = padding
      end

      def view_template(&block)
        render_responsive_styles if @columns > 1

        table(style: "background-color: #{@bg_color}; width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td { raw "&zwj;".html_safe }
            td(style: "background-color: #{@content_bg_color}; width: 600px; max-width: 100%;") do
              table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                tr do
                  td(style: "padding: #{@padding};") do
                    div(role: "separator", style: "line-height: 44px") { raw "&zwj;".html_safe }
                    table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                      tr do
                        yield if block_given?
                      end
                    end
                  end
                end
              end
            end
            td { raw "&zwj;".html_safe }
          end
        end
      end

      # Helper methods for creating columns
      def column(width: nil, content: nil, &block)
        calculated_width = width || calculate_column_width

        td(class: column_classes, style: "width: #{calculated_width}px") do
          if block_given?
            yield
          elsif content
            raw content.to_s.html_safe
          end
        end
      end

      def spacer
        td(class: "sm-w-full sm-block", style: "width: #{@gap}px; line-height: #{@gap}px") do
          raw "&zwj;".html_safe
        end
      end

      private

      def render_responsive_styles
        style do
          raw(<<~CSS.html_safe)
            @media screen and (max-width: 600px) {
              .sm-stack { display: block !important; width: 100% !important; }
              .sm-w-full {
                width: 100% !important;
              }
              .sm-mb-6 {
                margin-bottom: 24px !important;
              }
            }
          CSS
        end
      end

      def column_classes
        @columns > 1 ? "sm-w-full sm-block" : nil
      end

      def calculate_column_width
        # 600px total width - 48px padding (24px each side) = 552px
        available_width = 552
        gaps = (@columns - 1) * @gap
        (available_width - gaps) / @columns
      end
    end
  end
end

# frozen_string_literal: true

module Components
  module UiElements
    class Container < Phlex::HTML
      def initialize(
        content: nil,
        gutter_on_mobile: false,
        bg_color: "#f1f5f9",
        content_bg_color: "#fffffe",
        width: 600
      )
        @content = content
        @gutter_on_mobile = gutter_on_mobile
        @bg_color = bg_color
        @content_bg_color = content_bg_color
        @width = width
      end

      def view_template(&block)
        if @gutter_on_mobile
          render_with_gutters(&block)
        else
          render_flush(&block)
        end
      end

      private

      def render_flush(&block)
        table(style: "background-color: #{@bg_color}; width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td { raw "&zwj;".html_safe }
            td(style: "background-color: #{@content_bg_color}; width: #{@width}px; max-width: 100%;") do
              table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                tr do
                  td do
                    if block_given?
                      yield
                    elsif @content
                      raw @content.to_s.html_safe
                    end
                  end
                end
              end
            end
            td { raw "&zwj;".html_safe }
          end
        end
      end

      def render_with_gutters(&block)
        style do
          raw(<<~CSS.html_safe)
            @media screen and (max-width: 600px) {
              .sm-w-6 { width: 24px !important; }
            }
          CSS
        end

        table(style: "background-color: #{@bg_color}; width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td(class: "sm-w-6") { raw "&zwj;".html_safe }
            td(style: "background-color: #{@content_bg_color}; width: #{@width}px; max-width: 100%;") do
              table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                tr do
                  td do
                    if block_given?
                      yield
                    elsif @content
                      raw @content.to_s.html_safe
                    end
                  end
                end
              end
            end
            td(class: "sm-w-6") { raw "&zwj;".html_safe }
          end
        end
      end
    end
  end
end

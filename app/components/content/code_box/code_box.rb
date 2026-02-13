module Components
  module Content
    class CodeBox < Phlex::HTML
      def initialize(
        code: "123 456",
        label: nil,
        bg_color: "#f3f4f6",
        border_color: "#d7dadf",
        text_color: "#1f2937",
        label_color: "#4b5563",
        font_size: "36px",
        letter_spacing: "6px",
        border_radius: "6px"
      )
        @code = code
        @label = label
        @bg_color = bg_color
        @border_color = border_color
        @text_color = text_color
        @label_color = label_color
        @font_size = font_size
        @letter_spacing = letter_spacing
        @border_radius = border_radius
      end

      def view_template
        table(style: wrapper_styles, cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td { raw "&zwj;".html_safe }
            td(style: "width: 600px; max-width: 100%;") do
              table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                tr do
                  td(style: "padding: 24px;") do
                    render_box_content
                  end
                end
              end
            end
            td { raw "&zwj;".html_safe }
          end
        end
      end

      private

      def wrapper_styles
        "width: 100%; background-color: #ffffff;"
      end

      def render_box_content
        raw "<!--[if mso]>\n<v:roundrect arcsize=\"0.5\" style=\"width:100%; height:auto\" fillcolor=\"#{@bg_color}\" stroke=\"true\" strokecolor=\"#{@border_color}\" strokeweight=\"2px\" xmlns:v=\"urn:schemas-microsoft-com:vml\">\n<![endif]-->".html_safe

        table(style: box_table_styles, cellpadding: "0", cellspacing: "0", role: "none") do
          if @label
            tr do
              td(style: label_styles) do
                plain @label
              end
            end
          end

          tr do
            td(style: code_cell_styles) do
              code(style: code_styles) do
                plain @code
              end
            end
          end
        end

        raw "<!--[if mso]>\n</v:roundrect>\n<![endif]-->".html_safe
      end

      def box_table_styles
        "width: 100%; background-color: #{@bg_color}; border: 2px dashed #{@border_color}; border-radius: #{@border_radius}; border-collapse: separate;"
      end

      def label_styles
        "padding: 24px 24px 0 24px; text-align: center; font-size: 14px; color: #{@label_color}; font-weight: 500;"
      end

      def code_cell_styles
        padding = @label ? "16px 24px" : "32px 24px"
        "padding: #{padding}; text-align: center;"
      end

      def code_styles
        "display: block; font-size: #{@font_size}; font-weight: 700; color: #{@text_color}; letter-spacing: #{@letter_spacing}; font-family: 'Courier New', monospace; line-height: 1.2;"
      end
    end
  end
end

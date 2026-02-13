module Components
  module UiElements
    class DataTable < Phlex::HTML
      def initialize(rows: [], bg_color: "#f1f5f9", content_bg_color: "#fffffe")
        @rows = rows
        @bg_color = bg_color
        @content_bg_color = content_bg_color
      end

      def view_template
        render_styles

        table(
          style: "background-color: #{@bg_color}; width: 100%;",
          cellpadding: "0",
          cellspacing: "0",
          role: "none"
        ) do
          tr do
            td { unsafe_raw "&zwj;" }
            td(style: "background-color: #{@content_bg_color}; width: 600px; max-width: 100%;") do
              div(role: "separator", style: "line-height: 44px") { unsafe_raw "&zwj;" }

              table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                tr do
                  td(style: "padding-left: 24px; padding-right: 24px;") do
                    render_data_table
                  end
                end
              end
            end
            td { unsafe_raw "&zwj;" }
          end
        end
      end

      private

      def render_styles
        style do
          unsafe_raw <<~CSS
            @media (max-width: 599px) {
              .sm-block { display: block !important; }
              .sm-inline-block { display: inline-block !important; }
              .sm-hidden { display: none !important; }
              .sm-w-1-2 { width: 50% !important; }
              .sm-border-none { border-style: none !important; }
              .sm-p-0 { padding: 0 !important; }
              .sm-px-4 { padding-left: 16px !important; padding-right: 16px !important; }
              .sm-pb-0 { padding-bottom: 0 !important; }
              .sm-pb-3 { padding-bottom: 12px !important; }
              .sm-pb-4_5 { padding-bottom: 18px !important; }
              .sm-pt-1_5 { padding-top: 6px !important; }
            }
          CSS
        end
      end

      def render_data_table
        table(
          style: "width: 100%; table-layout: fixed;",
          cellpadding: "0",
          cellspacing: "0",
          role: "none"
        ) do
          render_table_header
          render_table_body
        end
      end

      def render_table_header
        thead do
          tr do
            th(
              class: "sm-block",
              style: "background-color: #f3f4f6; padding: 16px; text-align: left; font-size: 14px; line-height: 20px; font-weight: 600; color: #4b5563; border-bottom: 1px solid #d1d5db"
            ) { "Integration" }

            th(
              class: "sm-hidden",
              style: "background-color: #f3f4f6; padding: 16px; text-align: left; font-size: 14px; line-height: 20px; font-weight: 600; color: #4b5563; border-bottom: 1px solid #d1d5db"
            ) { "Service" }

            th(
              class: "sm-hidden",
              style: "background-color: #f3f4f6; padding: 16px; text-align: left; font-size: 14px; line-height: 20px; font-weight: 600; color: #4b5563; border-bottom: 1px solid #d1d5db"
            ) { "Action" }
          end
        end
      end

      def render_table_body
        tbody do
          @rows.each do |row|
            render_table_row(row)
          end
        end
      end

      def render_table_row(row)
        tr do
          # Category column
          td(
            class: "sm-block sm-pb-0 sm-border-none",
            style: "padding: 14px 16px; font-size: 12px; color: #6b7280; border-bottom: 1px solid #d1d5db"
          ) { row[:category] }

          # Service column with icon
          td(
            class: "sm-inline-block sm-w-1-2 sm-p-0",
            style: "padding: 14px 16px; vertical-align: bottom; border-bottom: 1px solid #d1d5db"
          ) do
            div(class: "sm-px-4 sm-pb-3 sm-pt-1_5") do
              table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                tr do
                  td(style: "width: 28px;") do
                    img(
                      src: row[:service_icon],
                      width: "28",
                      alt: ""
                    )
                  end
                  td(style: "width: 16px;") { unsafe_raw "&zwj;" }
                  td(style: "font-size: 12px; color: #6b7280;") { row[:service_name] }
                end
              end
            end
          end

          # Action column with link
          td(
            class: "sm-inline-block sm-w-1-2 sm-p-0",
            style: "padding: 14px 16px; font-size: 12px; font-weight: 600; color: #4b5563; border-bottom: 1px solid #d1d5db"
          ) do
            div(class: "sm-pb-4_5") do
              div do
                render_action_link(row)
              end
            end
          end
        end
      end

      def render_action_link(row)
        a(
          href: row[:action_url],
          style: "display: inline-block; text-decoration: none; line-height: 1; font-weight: 500; border-radius: 8px; background-color: transparent; padding: 0; font-size: 12px; color: #171717;"
        ) do
          whitespace
          comment { "[if mso]><i style=\"mso-text-raise: 24px; mso-font-width: 150%;\" hidden>&emsp;</i><![endif]" }
          whitespace
          span(style: "mso-text-raise: 14px; margin-right: 8px;") { row[:action_text] || "Manage" }
          whitespace
          comment { "[if mso]><i hidden style=\"mso-font-width: 30%;\">&emsp;&#8203;</i><![endif]" }
          whitespace
          span(style: "mso-text-raise: 14px") do
            img(
              src: row[:action_icon] || "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9ImN1cnJlbnRDb2xvciIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGNsYXNzPSJsdWNpZGUgbHVjaWRlLWFycm93LXJpZ2h0LWljb24gbHVjaWRlLWFycm93LXJpZ2h0Ij48cGF0aCBkPSJNNSAxMmgxNCIvPjxwYXRoIGQ9Im0xMiA1IDcgNy03IDciLz48L3N2Zz4=",
              width: "16",
              style: "max-width: 100%; vertical-align: middle;",
              alt: ""
            )
          end
          whitespace
          comment { "[if mso]><i style=\"mso-font-width: 150%;\" hidden>&emsp;&#8203;</i><![endif]" }
          whitespace
        end
      end
    end
  end
end

# frozen_string_literal: true

module Templates
  module Onboarding
    # Email Verification Template
    #
    # Template para verificação de email com código de verificação
    #
    # @example
    #   render Templates::Onboarding::EmailVerification.new(
    #     logo_url: "https://example.com/logo.png",
    #     logo_link: "https://app.linkana.com",
    #     verification_code: "ABCD1234",
    #     copyright_text: "© 2026 Linkana. Todos os direitos reservados.",
    #     help_center_url: "https://suporte.linkana.com/"
    #   )
    class EmailVerification < Phlex::HTML
      def initialize(
        logo_url: nil,
        logo_link: "https://app.linkana.com",
        logo_alt: "Linkana",
        logo_width: 120,
        verification_code: "ABC123",
        copyright_text: "© 2026 Linkana. Todos os direitos reservados.",
        help_center_url: "https://suporte.linkana.com/",
        help_center_text: "Central de Ajuda"
      )
        @logo_url = logo_url
        @logo_link = logo_link
        @logo_alt = logo_alt
        @logo_width = logo_width
        @verification_code = verification_code
        @copyright_text = copyright_text
        @help_center_url = help_center_url
        @help_center_text = help_center_text
      end

      def view_template
        div(align: "center", role: "article", "aria-roledescription": "email", lang: "pt-BR", "aria-label": "", style: "background-color: #ffffff; font-family: Inter, ui-sans-serif, system-ui, -apple-system, 'Segoe UI', sans-serif;") do
          table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
            tr do
              td do
                table(style: "width: 600px; max-width: 100%; margin: 0 auto;", cellpadding: "0", cellspacing: "0", role: "none") do
                  render_header
                  render_content
                  render_footer
                end
              end
            end
          end
        end
      end

      private

      def render_header
        comment { " Header (shared component) " }
        # Use the shared header component to keep header markup consistent
        render Components::Layout::Header.new(
          variant: :logo,
          logo_url: @logo_url,
          logo_alt: @logo_alt,
          logo_width: @logo_width,
          logo_link: @logo_link,
          # Ensure background matches the template content area
          bg_color: "#ffffff",
          content_bg_color: "#ffffff"
        )
      end

      def render_content
        comment { " Content Section " }
        tr do
          td do
            table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
              tr do
                td { unsafe_raw "&zwj;" }
                td(style: "width: 600px; max-width: 100%; background-color: #ffffff;") do
                  table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                    tr do
                      td(class: "sm-px-6 sm-px-4", style: "padding: 16px 24px;") do
                        comment { " Title " }
                        h1(class: "xs-text-2xl", style: "margin: 0 0 12px 0; font-size: 24px; font-weight: 600; color: #111827; line-height: 1.2;") do
                          plain "Seu código de acesso - Linkana"
                        end

                        comment { " Description " }
                        p(style: "margin: 0 0 24px 0; font-size: 16px; line-height: 1.5; color: #111827;") do
                          plain "Insira o código abaixo na tela de login. Ele é válido por "
                          strong(style: "color: #374151;") { plain "10 minutos" }
                          plain "."
                        end

                        comment { " Code Box Component " }
                        table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                          tr do
                            td do
                              comment { " Code Box with Outlook support " }
                              whitespace
                              comment { "[if mso]>\n                                <v:roundrect arcsize=\"10\" style=\"width:100%; height:auto\" fillcolor=\"#f3f4f6\" stroke=\"true\" strokecolor=\"#d7dadf\" strokeweight=\"2px\" xmlns:v=\"urn:schemas-microsoft-com:vml\">\n                                <center style=\"padding: 40px 24px;\">\n                                <![endif]" }
                              table(style: "width: 100%; background-color: #f3f4f6; border: 2px dashed #d1d5db; border-radius: 8px; border-collapse: separate;", cellpadding: "0", cellspacing: "0", role: "none") do
                                tr do
                                  td(style: "padding: 24px 24px 0 24px; text-align: center; font-size: 14px; line-height: 20px; color: #6b7280; font-weight: 500;") do
                                    plain "Código de Verificação"
                                  end
                                end
                                tr do
                                  td(style: "padding: 16px 24px 24px; text-align: center;") do
                                    code(class: "xs-text-lg", style: "display: block; font-size: 32px; font-weight: 700; color: #030712; letter-spacing: 8px; font-family: 'Courier New', Courier, monospace; line-height: 1.2;") do
                                      plain @verification_code
                                    end
                                  end
                                end
                              end
                              comment { "[if mso]>\n                                </center>\n                                </v:roundrect>\n                                <![endif]" }
                            end
                          end
                        end

                        comment { " Description " }
                        p(style: "margin: 24px 0 0 0; font-size: 16px; line-height: 24px; color: #6b7280;") do
                          plain "Se o código expirar, solicite um novo."
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

      def render_footer
        comment { " Footer (shared component) " }
        # Use the shared footer component to centralize footer markup
        render Components::Layout::Footer.new(
          copyright_text: @copyright_text,
          disclaimer_text: "",
          help_center_url: @help_center_url,
          help_center_text: @help_center_text,
          bg_color: "#ffffff",
          content_bg_color: "#ffffff",
          text_color: "#9ca3af"
        )
      end
    end
  end
end

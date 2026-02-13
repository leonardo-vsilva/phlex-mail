# frozen_string_literal: true

module Templates
  module Onboarding
    # Reset Password Template
    #
    # Template para redefinição de senha com link de reset
    #
    # @example
    #   render Templates::Onboarding::ResetPassword.new(
    #     logo_url: "https://example.com/logo.png",
    #     logo_link: "https://app.linkana.com",
    #     reset_url: "https://example.com/reset?token=abc123",
    #     copyright_text: "© 2026 Linkana. Todos os direitos reservados.",
    #     help_center_url: "https://suporte.linkana.com/"
    #   )
    class ResetPassword < Phlex::HTML
      def initialize(
        logo_url: nil,
        logo_link: "https://app.linkana.com",
        logo_alt: "Linkana",
        logo_width: 120,
        reset_url: "https://example.com/reset",
        copyright_text: "© 2026 Linkana. Todos os direitos reservados.",
        help_center_url: "https://suporte.linkana.com/",
        help_center_text: "Central de Ajuda",
        button_text: "Redefinir senha"
      )
        @logo_url = logo_url
        @logo_link = logo_link
        @logo_alt = logo_alt
        @logo_width = logo_width
        @reset_url = reset_url
        @copyright_text = copyright_text
        @help_center_url = help_center_url
        @help_center_text = help_center_text
        @button_text = button_text
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
                          plain "Esqueceu sua senha?"
                        end

                        comment { " Description " }
                        p(style: "margin: 0 0 24px 0; font-size: 16px; line-height: 24px; color: #111827;") do
                          plain "Recebemos uma solicitação para redefinir a senha da sua conta na Linkana. Clique no botão abaixo para criar uma nova senha."
                        end

                        comment { " CTA Button (shared component) " }
                        render Components::UiElements::Button.new(
                          variant: :primary,
                          size: :md,
                          text: @button_text,
                          href: @reset_url
                        )

                        comment { " Security Note " }
                        p(style: "margin: 24px 0 0 0; font-size: 14px; line-height: 20px; color: #9ca3af;") do
                          plain "Se você não solicitou a redefinição de senha, ignore este email. Seu acesso permanece seguro."
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

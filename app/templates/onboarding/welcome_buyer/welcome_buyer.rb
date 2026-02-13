# frozen_string_literal: true

module Templates
  module Onboarding
    # Welcome Buyer Template
    #
    # Template de boas-vindas para novos usuários buyers da plataforma
    #
    # @example
    #   render Templates::Onboarding::WelcomeBuyer.new(
    #     logo_url: "https://example.com/logo.png",
    #     logo_link: "https://app.linkana.com",
    #     user_email: "usuario@example.com",
    #     user_password: "SenhaTemp123",
    #     login_url: "https://app.linkana.com",
    #     copyright_text: "© 2026 Linkana. Todos os direitos reservados.",
    #     help_center_url: "https://suporte.linkana.com/"
    #   )
    class WelcomeBuyer < Phlex::HTML
      def initialize(
        logo_url: nil,
        logo_link: "https://app.linkana.com",
        logo_alt: "Linkana",
        logo_width: 120,
        user_email: "{{user_email}}",
        user_password: "{{user_password}}",
        login_url: "https://app.linkana.com",
        copyright_text: "© 2026 Linkana. Todos os direitos reservados.",
        help_center_url: "https://suporte.linkana.com/",
        help_center_text: "Central de Ajuda",
        button_text: "Acessar a plataforma"
      )
        @logo_url = logo_url
        @logo_link = logo_link
        @logo_alt = logo_alt
        @logo_width = logo_width
        @user_email = user_email
        @user_password = user_password
        @login_url = login_url
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
        render Components::Layout::Header.new(
          variant: :logo,
          logo_url: @logo_url,
          logo_alt: @logo_alt,
          logo_width: @logo_width,
          logo_link: @logo_link,
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
                        h1(class: "xs-text-3xl sm-leading-8", style: "margin: 0 0 24px 0; font-size: 32px; font-weight: 700; color: #111827; line-height: 1.2;") do
                          plain "Bem-vindo à Linkana!"
                        end

                        comment { " Mission Statement " }
                        p(style: "margin: 0 0 16px 0; font-size: 16px; line-height: 24px; color: #374151;") do
                          strong(style: "color: #111827;") { plain "Sua conta está pronta!" }
                          plain " A partir de agora, você tem uma forma mais simples e eficiente de gerenciar todo o ciclo de vida dos seus fornecedores, "
                          strong(style: "color: #111827;") { plain "do cadastro à homologação" }
                          plain "."
                        end

                        comment { " Credentials Section Title " }
                        h2(style: "margin: 0 0 16px 0; font-size: 18px; font-weight: 600; color: #111827; line-height: 1.3;") do
                          plain "Seus dados de acesso à nossa plataforma:"
                        end

                        comment { " Credentials Box " }
                        render_credentials_box

                        comment { " Security Note " }
                        p(style: "margin: 16px 0 24px 0; font-size: 13px; line-height: 18px; color: #9ca3af;") do
                          plain "💡 Dica: Recomendamos alterar sua senha no primeiro acesso para manter sua conta segura."
                        end

                        comment { " CTA Button (shared component) " }
                        render Components::UiElements::Button.new(
                          variant: :primary,
                          size: :md,
                          text: @button_text,
                          href: @login_url,
                          font_weight: "600"
                        )
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

      def render_credentials_box
        table(style: "width: 100%; background-color: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; border-collapse: separate;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td(style: "padding: 24px;") do
              table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
                # Login Row
                tr do
                  td(style: "padding-bottom: 16px;") do
                    p(style: "margin: 0 0 4px 0; font-size: 12px; line-height: 16px; font-weight: 600; color: #6b7280; text-transform: uppercase; letter-spacing: 0.5px;") do
                      plain "Login"
                    end
                    p(style: "margin: 0; font-size: 16px; line-height: 24px; font-weight: 500; color: #111827; font-family: 'Courier New', Courier, monospace;") do
                      plain @user_email
                    end
                  end
                end

                # Divider
                tr do
                  td(style: "padding-bottom: 16px;") do
                    div(style: "height: 1px; background-color: #e5e7eb;") { unsafe_raw "&zwj;" }
                  end
                end

                # Password Row
                tr do
                  td do
                    p(style: "margin: 0 0 4px 0; font-size: 12px; line-height: 16px; font-weight: 600; color: #6b7280; text-transform: uppercase; letter-spacing: 0.5px;") do
                      plain "Senha"
                    end
                    p(style: "margin: 0; font-size: 16px; line-height: 24px; font-weight: 500; color: #111827; font-family: 'Courier New', Courier, monospace;") do
                      plain @user_password
                    end
                  end
                end
              end
            end
          end
        end
      end

      def render_footer
        comment { " Footer (shared component) " }
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

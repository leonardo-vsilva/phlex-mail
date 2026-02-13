# frozen_string_literal: true

module Components
  module Layout
    # Header Component - Phlex Implementation
    #
    # Componente de cabeçalho otimizado para e-mail, com suporte aos principais
    # clientes de e-mail.
    #
    # @example Header básico com logo
    #   render Components::Layout::Header.new(
    #     variant: :logo,
    #     logo_url: "https://example.com/logo.png",
    #     logo_alt: "Company Name"
    #   )
    #
    # @example Header com informações do usuário
    #   render Components::Layout::Header.new(
    #     variant: :user,
    #     logo_url: "https://example.com/logo.png",
    #     logo_alt: "Company",
    #     user_initials: "JD",
    #     user_name: "John Doe",
    #     user_email: "john@example.com"
    #   )
    #
    # @example Header com ícones sociais
    #   render Components::Layout::Header.new(
    #     variant: :social,
    #     logo_url: "https://example.com/logo.png",
    #     logo_alt: "Company",
    #     social_links: [
    #       { url: "https://github.com/company", icon_url: "github.png", alt: "GitHub" }
    #     ]
    #   )
    class Header < Phlex::HTML
      # @param variant [Symbol] Variante do header (:logo, :user, :social)
      # @param logo_url [String] URL da logo
      # @param logo_alt [String] Texto alternativo da logo
      # @param logo_width [Integer] Largura da logo em pixels
      # @param logo_link [String] Link da logo (opcional)
      # @param user_initials [String] Iniciais do usuário (para variant :user)
      # @param user_name [String] Nome do usuário (para variant :user)
      # @param user_email [String] Email do usuário (para variant :user)
      # @param social_links [Array<Hash>] Links sociais (para variant :social)
      # @param bg_color [String] Cor de fundo externa
      # @param content_bg_color [String] Cor de fundo do conteúdo
      def initialize(
        variant: :logo,
        logo_url: nil,
        logo_alt: "Logo",
        logo_width: 80,
        logo_link: nil,
        user_initials: nil,
        user_name: nil,
        user_email: nil,
        social_links: [],
        bg_color: "#f1f5f9",
        content_bg_color: "#ffffff"
      )
        @variant = variant
        @logo_url = logo_url
        @logo_alt = logo_alt
        @logo_width = logo_width
        @logo_link = logo_link
        @user_initials = user_initials
        @user_name = user_name
        @user_email = user_email
        @social_links = social_links
        @bg_color = bg_color
        @content_bg_color = content_bg_color
      end

      def view_template
        table(
          style: "width: 100%; background-color: #{@bg_color};",
          cellpadding: "0",
          cellspacing: "0",
          role: "none"
        ) do
          tr do
            td { raw "&zwj;".html_safe }
            td(style: "width: 600px; max-width: 100%;") do
              render_content_table
            end
            td { raw "&zwj;".html_safe }
          end
        end
      end

      private

      def render_content_table
        table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td(style: content_td_style) do
              case @variant
              when :logo
                render_logo_only
              when :user
                render_with_user
              when :social
                render_with_social
              end
            end
          end
        end
      end

      def content_td_style
        styles = [ "background-color: #{@content_bg_color}", "padding: 24px" ]
        styles << "text-align: left" if @variant == :logo
        styles.join("; ") + ";"
      end

      def render_logo_only
        if @logo_url
          img(
            src: @logo_url,
            width: @logo_width.to_s,
            alt: @logo_alt,
            style: "max-width: 100%; vertical-align: middle;"
          )
        end
      end

      def render_with_user
        table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            # Logo column
            td(style: "width: #{@logo_width}px;") do
              if @logo_url
                a(href: @logo_link || "#") do
                  img(
                    src: @logo_url,
                    width: @logo_width.to_s,
                    alt: @logo_alt,
                    style: "max-width: 100%; vertical-align: middle;"
                  )
                end
              end
            end

            # User info column
            td do
              table(
                align: "right",
                style: "margin: 0 0 0 auto;",
                cellpadding: "0",
                cellspacing: "0",
                role: "none"
              ) do
                tr do
                  # Avatar
                  td do
                    render_user_avatar
                  end

                  # Spacer
                  td(style: "width: 12px;") { raw "&zwj;".html_safe }

                  # User details
                  td do
                    if @user_name
                      p(style: "margin: 0; font-size: 12px; line-height: 16px; font-weight: 500; color: #4b5563;") do
                        plain @user_name
                      end
                    end
                    if @user_email
                      p(style: "margin: 0; font-size: 12px; line-height: 16px; color: #6b7280;") do
                        plain @user_email
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end

      def render_with_social
        table(style: "width: 100%;", cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            # Logo column
            td(style: "width: #{@logo_width}px;") do
              if @logo_url
                a(href: @logo_link || "#") do
                  img(
                    src: @logo_url,
                    width: @logo_width.to_s,
                    alt: @logo_alt,
                    style: "max-width: 100%; vertical-align: middle;"
                  )
                end
              end
            end

            # Social icons column
            td do
              table(
                align: "right",
                style: "margin: 0 0 0 auto;",
                cellpadding: "0",
                cellspacing: "0",
                role: "none"
              ) do
                tr do
                  @social_links.each_with_index do |link, index|
                    # Spacer before icon
                    if index == 0
                      td(style: "width: 24px;") { raw "&zwj;".html_safe }
                    else
                      td(style: "width: 24px;") { raw "&zwj;".html_safe }
                    end

                    # Social icon
                    td do
                      a(href: link[:url]) do
                        img(
                          src: link[:icon_url],
                          alt: link[:alt],
                          width: "20",
                          style: "max-width: 100%; vertical-align: middle;"
                        )
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end

      def render_user_avatar
        # Conditional comment for Outlook - abertura
        raw "<!--[if mso]>".html_safe
        raw '<v:roundrect arcsize="0.5" style="width:32px; height:32px" fillcolor="#f3f4f6" stroke="false" xmlns:v="urn:schemas-microsoft-com:vml">'.html_safe
        raw "<![endif]-->".html_safe

        table(cellpadding: "0", cellspacing: "0", role: "none") do
          tr do
            td(style: "width: 32px; height: 32px; border-radius: 9999px; background-color: #f3f4f6; text-align: center;") do
              span(style: "mso-text-raise: 12px; font-size: 10px; line-height: 32px; font-weight: 600; color: #030712;") do
                plain @user_initials || "??"
              end
            end
          end
        end

        # Conditional comment for Outlook - fechamento
        raw "<!--[if mso]>".html_safe
        raw "</v:roundrect>".html_safe
        raw "<![endif]-->".html_safe
      end
    end
  end
end

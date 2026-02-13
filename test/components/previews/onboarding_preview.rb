require Rails.root.join("app/templates/onboarding/company_invitation/company_invitation.rb")
require Rails.root.join("app/templates/onboarding/email_verification/login_code.rb")
require Rails.root.join("app/templates/onboarding/reset_password/reset_password.rb")
require Rails.root.join("app/templates/onboarding/welcome_buyer/welcome_buyer.rb")
require Rails.root.join("app/components/layout/header/header.rb")
require Rails.root.join("app/components/layout/footer/footer.rb")

class OnboardingPreview < ViewComponent::Preview
  # @label Company Invitation
  def company_invitation
    render(Templates::Onboarding::CompanyInvitation.new(
      logo_url: "https://bucket.mailersendapp.com/0r83ql3eyx4zw1jm/0p7kx4xem8g9yjre/images/9e767506-c199-4ad6-8b4a-c49a3f3ae02f.png",
      logo_link: "https://app.linkana.com",
      logo_alt: "Linkana",
      logo_width: 120,
      owner_name: "João Silva",
      owner_email: "joao@linkana.com",
      buyer_name: "Empresa XYZ Ltda",
      signup_url: "https://app.linkana.com/signup?token=abc123"
    ))
  end

  # @label Email Verification
  def email_verification
    render(Templates::Onboarding::EmailVerification.new(
      logo_url: "https://bucket.mailersendapp.com/0r83ql3eyx4zw1jm/0p7kx4xem8g9yjre/images/9e767506-c199-4ad6-8b4a-c49a3f3ae02f.png",
      logo_link: "https://app.linkana.com",
      logo_alt: "Linkana",
      logo_width: 120,
      verification_code: "ABC123"
    ))
  end

  # @label Reset Password
  def reset_password
    render(Templates::Onboarding::ResetPassword.new(
      logo_url: "https://bucket.mailersendapp.com/0r83ql3eyx4zw1jm/0p7kx4xem8g9yjre/images/9e767506-c199-4ad6-8b4a-c49a3f3ae02f.png",
      logo_link: "https://app.linkana.com",
      logo_alt: "Linkana",
      logo_width: 120,
      reset_url: "https://example.com/reset?token=abc123"
    ))
  end

  # @label Welcome Buyer
  def welcome_buyer
    render(Templates::Onboarding::WelcomeBuyer.new(
      logo_url: "https://bucket.mailersendapp.com/0r83ql3eyx4zw1jm/0p7kx4xem8g9yjre/images/9e767506-c199-4ad6-8b4a-c49a3f3ae02f.png",
      logo_link: "https://app.linkana.com",
      logo_alt: "Linkana",
      logo_width: 120,
      user_email: "usuario@example.com",
      user_password: "SenhaTemp123",
      login_url: "https://app.linkana.com"
    ))
  end
end

require Rails.root.join("app/components/ui/data tables/data_table.rb")

module UiElements
  class DataTablePreview < ViewComponent::Preview
    def default
      rows = [
        {
          category: "Messaging",
          service_name: "Slack",
          service_icon: "https://d2264344waaff4.cloudfront.net/assets/email/slack.png",
          action_text: "Configure",
          action_url: "#"
        },
        {
          category: "Code",
          service_name: "GitHub",
          service_icon: "https://d2264344waaff4.cloudfront.net/assets/email/github.png",
          action_url: "#"
        },
        {
          category: "Design",
          service_name: "Figma",
          service_icon: "https://d2264344waaff4.cloudfront.net/assets/email/figma.png",
          action_text: "Connect",
          action_url: "#"
        }
      ]

      render(Components::UiElements::DataTable.new(rows: rows))
    end
  end
end

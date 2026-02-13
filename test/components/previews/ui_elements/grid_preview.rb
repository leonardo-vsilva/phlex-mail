require Rails.root.join("app/components/ui/grid/grids.rb")

module UiElements
  class GridPreview < ViewComponent::Preview
    # @label Single Column
    def single_column
      render(Components::UiElements::Grid.new(columns: 1)) do |grid|
        grid.column do
          "Full width column content"
        end
      end
    end

    # @label Two Columns
    def two_columns
      render(Components::UiElements::Grid.new(columns: 2)) do |grid|
        grid.column do
          "Left column content"
        end
        grid.spacer
        grid.column do
          "Right column content"
        end
      end
    end

    # @label Three Columns
    def three_columns
      render(Components::UiElements::Grid.new(columns: 3)) do |grid|
        grid.column do
          "Column 1"
        end
        grid.spacer
        grid.column do
          "Column 2"
        end
        grid.spacer
        grid.column do
          "Column 3"
        end
      end
    end
  end
end

require "yaml"

class Seed::Categories < LuckyCli::Task
  banner "Seed the app with some initial categories"

  def call
    yaml = File.read("tasks/seed/categories.yml")
    categories = YAML.parse(yaml)

    categories.each do |title|
      params = LuckyRecord::Params.new({"title" => title.as_s})
      CategoryForm.create(params) do |form, category|
        if category
          puts "Created Category: #{category.title.colorize(:green)}"
        else
          puts "Problem creating category:"
          form.errors.each do |field, errors|
            puts "#{field} #{title.colorize(:red)} #{errors.join(", ")}"
          end
        end
      end
    end
  end
end

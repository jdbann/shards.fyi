abstract class MainLayout
  include Lucky::HTMLPage
  include Shared::FieldErrorsComponent
  include Shared::FlashComponent

  # You can put things here that all pages need
  #
  # Example:
  #   needs current_user : User

  abstract def content

  def render
    html_doctype

    html lang: "en" do
      head do
        utf8_charset
        title page_title
        css_link asset("css/app.css")
        js_link asset("js/app.js")
        csrf_meta_tags
        responsive_meta_tag
      end

      body do
        header class: "header" do
          div class: "wrapper" do
            link "shards.fyi", to: Shards::Index, class: "header-brand"
          end
        end
        div class: "wrapper" do
          render_flash
          content
        end
      end
    end
  end

  def page_title
    "shards.fyi"
  end
end

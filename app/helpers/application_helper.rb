module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def form_error_notification(object)
    if object.errors.any?
      tag.div class: "error-message" do
        object.errors.full_messages.to_sentence.capitalize
      end
    end
  end

  def nested_dom_id(*args)
    args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join("_")
  end

  # With the helper we can generate and read our dom_ids
  # line_item_date = LineItemDate.find(1)
  # nested_dom_id(line_item_date, LineItem.new)
  # => line_item_date_1_new_line_item
  # nested_dom_id(line_item_date, "line_items")
  # => line_item_date_1_line_items
end

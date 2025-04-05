require "test_helper"

class StatusBadgeComponentTest < ViewComponent::TestCase
  def test_component_renders_not_started_status
    component = StatusBadgeComponent.new(status: "not_started")
    render_inline(component)

    assert_selector "span.bg-blue-100.text-blue-800"
    assert_text "Not started"
  end

  def test_component_renders_in_progress_status
    component = StatusBadgeComponent.new(status: "in_progress")
    render_inline(component)

    assert_selector "span.bg-yellow-100.text-yellow-800"
    assert_text "In progress"
  end

  def test_component_renders_done_status
    component = StatusBadgeComponent.new(status: "done")
    render_inline(component)

    assert_selector "span.bg-green-100.text-green-800"
    assert_text "Done"
  end
end

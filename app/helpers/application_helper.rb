module ApplicationHelper
  def eval_with_rescue(code)
    begin
      eval(code)
    rescue Exception => e
      "error"
    end
  end

  def bar_color(color="#ffffff")
    "<span class='btn btn-flat bg-black no-padding2' style='background: #{color} !important'>&nbsp;</span>".html_safe
  end
end

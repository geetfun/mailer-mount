module MailerMount
  module ApplicationHelper
    def flash_class(level)
      case level.to_sym
      when :notice then "bg-blue-100 text-blue-800"
      when :success then "bg-green-100 text-green-800"
      when :error then "bg-red-100 text-red-800"
      when :alert then "bg-yellow-100 text-yellow-800"
      else "bg-gray-100 text-gray-800"
      end
    end

    def subscription_checkmark(subscribed)
      svg_tag = ''
      if subscribed
        svg_tag = <<~SVG
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="green" class="ml-2 h-6 w-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
          </svg>
        SVG
      end

      content_tag(:span, svg_tag, class: 'h-6 w-6 rounded-full border border-2').html_safe
    end
  end
end

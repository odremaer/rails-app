module ApplicationHelper
 def flash_message
   flash.map do |key, msg|
     content_tag :div, raw(msg), class: "flash #{key}"
   end.join.html_safe
 end

 def current_year
   "Current year - #{Time.current.year}"
 end

 def github_url(author, repo)
   link_to "Проект", "https://github.com/#{author}/#{repo}", rel: "nofollow", target: "_blank"
 end

end

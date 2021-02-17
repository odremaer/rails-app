module ApplicationHelper
 def flash_message 
   if flash[:alert]
     content_tag :p, flash[:alert], class: 'flash alert'
   end
 end

 def current_year
   "Current year - #{Time.current.year}"
 end

 def github_url(author, repo)
   link_to "Проект", "https://github.com/#{author}/#{repo}", rel: "nofollow", target: "_blank"
 end

end

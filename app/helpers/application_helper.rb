module ApplicationHelper

 def current_year
   "#{Time.zone.now.year}г. в городе #{Time.zone.name}"
 end

 def github_url(author, repo)
   link_to "Проект", "https://github.com/#{author}/#{repo}", rel: "nofollow", target: "_blank"
 end

end

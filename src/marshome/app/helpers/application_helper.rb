module ApplicationHelper
    def avatar_url(user)
        if user.image_fb
            "http://graph.facebook.com/#{user.uid}/picture?type=large"
        else
       
        "/slide/person1.png"
        end
    end
end

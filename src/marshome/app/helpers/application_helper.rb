module ApplicationHelper
    def avatar_url(user)
       if user.profile_picture == 'Alien 2'
        "/avatars/a2.png"
       elsif user.profile_picture == 'Alien 3'
        "/avatars/a3.png"
    elsif user.profile_picture == 'Alien 4'
        "/avatars/a4.png"
    elsif user.profile_picture == 'Alien 5'
        "/avatars/a5.png"
    elsif user.profile_picture == 'Alien 6'
        "/avatars/a6.png"
    elsif user.profile_picture == 'Alien 7'
        "/avatars/a7.png"
    elsif user.profile_picture == 'Alien 8'
        "/avatars/a8.png"
    elsif user.profile_picture == 'Alien 9'
        "/avatars/a9.png"
    elsif user.profile_picture == 'Alien 10'
        "/avatars/a10.png"
    elsif user.profile_picture == 'Alien 11'
        "/avatars/a11.png"
    elsif user.profile_picture == 'Alien 12'
        "/avatars/a12.png"
    else
        "/avatars/a1.png"
       end
     end
end

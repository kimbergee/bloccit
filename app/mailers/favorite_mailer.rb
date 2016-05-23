class FavoriteMailer < ApplicationMailer
  default from: "kimber.gee@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@gentle-forest-26737.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@gentle-forest-26737.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@gentle-forest-26737.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"] = "<post/#{post.id}@gentle-forest-26737.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@gentle-forest-26737.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@gentle-forest-26737.herokuapp.com>"

    @post = post

    mail(to: post.user.email, subject: "You will now receive all activity on #{post.title}")
  end

end

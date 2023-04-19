class Admin::HomesController < ApplicationController
 def top
  @post = Post.new
  @posts = Post.all
 end
end

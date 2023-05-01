class Admin::HomesController < ApplicationController
 def top
  @post = Post.new
  @posts = Post.all
  @liquor = Liquor.all
  
 end
end

# frozen_string_literal: true
class SiteController < ApplicationController
  def index
    @pictures = []
    Dir.foreach('./public/images') do |picture|
      next if picture == '.' or picture == '..'
      @pictures << picture
    end
  end
end

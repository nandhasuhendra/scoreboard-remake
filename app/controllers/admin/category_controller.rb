require_relative 'application_controller'
require_relative '../../models/category'

module Admin
  class CategoryController < ApplicationController
    def index
      @resources = Category.all

      render("admin/category/index")
    end

    def create
      print "Category name : "
      category = gets.chomp

      @resource = Category.new(category: category)
      if @resource.save
        render("admin/category/create")
      else
        render("shared/error")
      end
    end

    def update
      print "Select category id for update : "
      id = gets.chomp

      return puts "Category is not added." unless @resource = Category.find_by_id(id)

      print "New category                  : "
      category = gets.chomp

      if @resource.update(category: category)
        render("admin/category/edit")
      else
        render("shared/error")
      end
    end

    def delete
      print "Select category id for delete : "
      id = gets.chomp

      return puts "Category is not added." unless @resource = Category.find_by_id(id)

      unless @resource.blank?
        @resource.destroy

        puts "Category is deleted"
      else
        puts "Category is not ready"
      end
    end
  end
end

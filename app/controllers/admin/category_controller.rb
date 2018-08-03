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
      @category = gets.chomp

      @resource = Category.new(category: @category)
      if @resource.save
        render("admin/category/create")
      else
        render("shared/error")
      end
    end

    def update
      print "Insert category for update : "
      @category = gets.chomp

      return puts "Category is not added." unless @resource = Category.find_by(category: @category)

      print "New category          : "
      @category = gets.chomp

      if @resource.update(category: @category)
        render("admin/category/edit")
      else
        render("shared/error")
      end
    end

    def delete
      print "Delete category : "
      @category = gets.chomp

      return puts "Category is not added." unless @resource = Category.find_by(category: @category)

      unless @resource.blank?
        @resource.destroy

        puts "Category is deleted"
      else
        puts "Category is not ready"
      end
    end

    private
    def category_params
    end
  end
end

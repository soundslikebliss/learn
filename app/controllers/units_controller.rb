class UnitsController < ApplicationController
  def index
    @units = Unit.all
    @unit = Unit.new
    render('units/index.html.erb')
  end

  def show
    @unit = Unit.find(params[:id])
    render('units/show.html.erb')
  end

  def new
    @unit = Unit.new
    render('units/new.html.erb')
  end

  def create
    @unit = Unit.new(:number => params[:number],
                        :title => params[:title])
    if @unit.save
      redirect_to("/units/#{@unit.id}")
    else
      render('units/new.html.erb')
    end
  end

  def edit
    @unit = Unit.find(params[:id])
    render('units/edit.html.erb')
  end

  def update
    @unit = Unit.find(params[:id])
    if @unit.update(number: params[:number],
                    title: params[:title])
      render('units/success.html.erb')
    else
      render('units/edit.html.erb')
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
    render('units/destroy.html.erb')
  end
end

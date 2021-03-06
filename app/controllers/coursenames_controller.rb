class CoursenamesController < ApplicationController
  #before_action :set_coursename, only: [:show, :edit, :update, :destroy]

  # GET /coursenames
  # GET /coursenames.json
  def index
    if params[:search]
      @coursenames = Coursename.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    else  
      @coursenames = Coursename.find(:all)
   # @coursenames = Coursename.all
   # @coursenames, @alphaParams = Coursename.all.alpha_paginate(params[:letter]){|coursename| coursename.name}
  end
end

  # GET /coursenames/1
  # GET /coursenames/1.json
  def show
    @coursename = Coursename.find(params[:id])
  end

  #def search
  #@coursename = Coursename.find(params[:search])
  #end

  # GET /coursenames/new
  def new
    @coursename = Coursename.new
  end

  # GET /coursenames/1/edit
  def edit
    @coursename = Coursename.find(params[:id])
  end

  # POST /coursenames
  # POST /coursenames.json
  def create
    @coursename = Coursename.new(coursename_params)

    respond_to do |format|
      if @coursename.save
        format.html { redirect_to @coursename, notice: 'Coursename was successfully CREATED.' }
        format.json { render action: 'show', status: :created, location: @coursename }
      else
        format.html { render action: 'new' }
        format.json { render json: @coursename.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coursenames/1
  # PATCH/PUT /coursenames/1.json
  def update
    @coursename = Coursename.find(params[:id])
    
    respond_to do |format|
      if @coursename.update(coursename_params)
        format.html { redirect_to @coursename, notice: 'Coursename was successfully UPDATED.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @coursename.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coursenames/1
  # DELETE /coursenames/1.json
  def destroy
    @coursename = Coursename.find(params[:id])
    @coursename.destroy
    respond_to do |format|
      format.html { redirect_to coursenames_url, notice: 'Coursename was successfully DELETED.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coursename
      @coursename = Coursename.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coursename_params
      params.require(:coursename).permit(:name)
    end
end

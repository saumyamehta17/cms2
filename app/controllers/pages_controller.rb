class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  def index
    debugger
    @pages = Page.all
     @site = Site.find(params[:site_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @site = Site.find(params[:site_id])
    @page = Page.find(params[:id])
    @pages = Page.all
    @page.site = @site
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @site = Site.find(params[:site_id])
    @page = Page.new
     @pages = Page.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    
    @site = Site.find(params[:site_id])
    @page = Page.find(params[:id])
    @page.site = @site
    @pages = Page.all
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])
    @site = Site.find( params[:site_id])
    @page.site = @site
      # @page.site_id = Site.select(:id)
        
      respond_to do |format|
      if @page.save
        # format.html { redirect_to [@site, @page] , notice: 'Page was successfully created.' }
        format.html { redirect_to site_page_path(@site, @page) , notice: 'Page was successfully created.' }        
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end
   
  # PUT /pages/1
  # PUT /pages/1.json
  def update
    
    @page = Page.find(params[:id])
    @site = Site.find(params[:site_id])
     @pages = Page.all
     @page.site = @site
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
end

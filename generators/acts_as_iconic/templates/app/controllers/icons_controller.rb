class IconsController < ApplicationController
  # GET /icons
  # GET /icons.xml
  def index
    @icons = Icon.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @icons.to_xml }
    end
  end

  # GET /icons/1
  # GET /icons/1.xml
  def show
    @icon = Icon.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @icon.to_xml }
    end
  end

  # GET /icons/new
  def new
    @icon = Icon.new
  end

  # GET /icons/1;edit
  def edit
    @icon = Icon.find(params[:id])
    @current_mt = MimeType.find_all_by_icon_id(@icon.id, :order => :content_type)
    @unassoc_mt = MimeType.find_all_by_icon_id(0, :order => :content_type).collect {|m|[m.content_type+' -- '+m.ext.to_s, m.id]}
    @unassoc_mt_ext = MimeType.find_all_by_icon_id(0, :order => :ext).collect {|m|[m.ext.to_s+' -- '+m.content_type.to_s, m.id]}
    @available_mt = MimeType.find(:all, :order => :content_type, :conditions => ["icon_id != ?", @icon.id]).collect {|m|[m.content_type+' -- '+m.ext.to_s, m.id]}
  end

  # POST /icons
  # POST /icons.xml
  def create
    @icon = Icon.new(params[:icon])

    respond_to do |format|
      if @icon.save
        flash[:notice] = 'Icon was successfully created.'
        format.html { redirect_to icons_url }
        format.xml  { head :created, :location => icon_url(@icon) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @icon.errors.to_xml }
      end
    end
  end

  # PUT /icons/1
  # PUT /icons/1.xml
  def update
    @icon = Icon.find(params[:id])

    respond_to do |format|
      if @icon.update_attributes(params[:icon])
        flash[:notice] = 'Icon was successfully updated.'
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @icon.errors.to_xml }
      end
    end
  end

  # DELETE /icons/1
  # DELETE /icons/1.xml
  def destroy
    @icon = Icon.find(params[:id])
    @icon.destroy

    respond_to do |format|
      format.html { redirect_to icons_url }
      format.xml  { head :ok }
    end
  end
end

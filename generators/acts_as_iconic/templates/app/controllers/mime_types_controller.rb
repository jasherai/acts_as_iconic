class MimeTypesController < ApplicationController
  # GET /mime_types
  # GET /mime_types.xml
  def index
    @mime_types = MimeType.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @mime_types.to_xml }
    end
  end

  # GET /mime_types/1
  # GET /mime_types/1.xml
  def show
    @mime_type = MimeType.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @mime_type.to_xml }
    end
  end

  # GET /mime_types/new
  def new
    @mime_type = MimeType.new
  end

  # GET /mime_types/1;edit
  def edit
    @mime_type = MimeType.find(params[:id])
  end

  # POST /mime_types
  # POST /mime_types.xml
  def create
    @mime_type = MimeType.new(params[:mime_type])

    respond_to do |format|
      if @mime_type.save
        flash[:notice] = 'MimeType was successfully created.'
        format.html { redirect_to mime_type_url(@mime_type) }
        format.xml  { head :created, :location => mime_type_url(@mime_type) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mime_type.errors.to_xml }
      end
    end
  end

  # PUT /mime_types/1
  # PUT /mime_types/1.xml
  def update
    @mime_type = MimeType.find(params[:id])

    respond_to do |format|
      if @mime_type.update_attributes(params[:mime_type])
        flash[:notice] = 'MimeType was successfully updated.'
        format.html { redirect_to mime_type_url(@mime_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mime_type.errors.to_xml }
      end
    end
  end

  # DELETE /mime_types/1
  # DELETE /mime_types/1.xml
  def destroy
    @mime_type = MimeType.find(params[:id])
    @mime_type.destroy

    respond_to do |format|
      format.html { redirect_to mime_types_url }
      format.xml  { head :ok }
    end
  end
  
  def icon_assoc
    for mt in MimeType.find_all_by_id(params[:mime_types])     
      mt.update_attribute(:icon_id, params[:icon_id])
    end
    respond_to do |format|
      flash[:notice] = 'Mime Types successfully associated.'
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
  
  def icon_disassoc
    MimeType.find_by_id(params[:id]).update_attribute(:icon_id, 0)
    respond_to do |format|
      flash[:notice] = 'Mime Type successfully disassociated.'
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
  
end

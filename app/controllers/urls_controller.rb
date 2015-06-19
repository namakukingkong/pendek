class UrlsController < ApplicationController
  before_action :set_url, only: [:edit, :update, :destroy, :stats, :goto]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def stats
  end


  # GET /urls/new
  def goto
    #save request and useragent
    @url.infos.create(raw: {ip: request.remote_ip, ua: request.env["HTTP_USER_AGENT"]})
    redirect_to @url.origin, :status => 301
  end

  def new
    @url = Url.new
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)
    respond_to do |format|
      if @url.save
        format.html { redirect_to stats_path(id: @url.short), notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to @url, notice: 'Url was successfully updated.' }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find_by(short: params[:id])
      redirect_to  root_path , notice: 'Url not foud, u can create it!' if  @url.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      #just origin n infos
      params.require(:url).permit(:origin, :short)
    end
end

class TracksController < ApplicationController
  before_action :set_track, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /tracks or /tracks.json
  def index
    @tracks = Track.all
  end

  # GET /tracks/1 or /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = Track.new
    @basic_licence = Licence.new
    @exclusive_licence = Licence.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks or /tracks.json
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        # Guardando licencia basica por params y exclusiva

        @basic_licence = Licence.new(price: params[:basic_price],
          licence_name_id: params[:basic_licence_name_id], track_id: @track.id)
        @basic_licence.save

        @exclusive_licence = Licence.new(price: params[:exclusive_price],
          licence_name_id: params[:exclusive_licence_name_id], track_id: @track.id)
        @exclusive_licence.save

        format.html { redirect_to @track, notice: "#{t 'activerecord.successful.messages.created.default'}" }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1 or /tracks/1.json
  def update
    # TODO eliminar todas las licencias basicas/exclusivas actuales antes de actualizar
    
    respond_to do |format|
      if @track.update(track_params)
        # Guardando licencia basica por params y exclusiva

        unless @track.basic_licence.blank?
          @basic_licence = @track.basic_licence
          @basic_licence.price = params[:basic_price]
        else
          @basic_licence = Licence.new(price: params[:basic_price],
            licence_name_id: params[:basic_licence_name_id], track_id: @track.id)
        end
        @basic_licence.save
        
        unless @track.exclusive_licence.blank?
          @exclusive_licence = @track.exclusive_licence
          @exclusive_licence.price = params[:exclusive_price]
        else
          @exclusive_licence = Licence.new(price: params[:exclusive_price],
            licence_name_id: params[:exclusive_licence_name_id], track_id: @track.id)
        end
        @exclusive_licence.save

        format.html { redirect_to @track, notice: "#{t 'activerecord.successful.messages.updated'}" }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1 or /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: "/") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def track_params
      params.require(:track).permit(:img_url, :title, :bpm, :user_id, :tagged_audio)
    end
    def licence_params
      params.require(:b_licence).permit(:price, :licence_name_id)
    end

end

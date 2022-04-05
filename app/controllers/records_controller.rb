class RecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # GET /records or /records.json
  def index
    if params[:query].present?
      @records = Record.search_by_title(params[:query]) 
    else
      @records = Record.all
    end
  end

  # GET /records/1 or /records/1.json
  def show
    @record = Record.find(params[:id])
    @next_record = Record.where("id > ?", params[:id]).order("id ASC").first
    @prev_record = Record.where("id < ?", params[:id]).order("id DESC").first
    @tag = Tag.new
    @tracks = Track.where(record_id: @record.id)
    @artists = Artist.where(id: @tracks.pluck(:artist_id))

  end

  private
    def record_params
      params.require(:record).permit(:title, :artist, :year, :bpm, :key, :image, :comment)
    end
end

class TagsController < ApplicationController
  before_action :set_tag, only: %i[ edit update destroy ]

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # POST /tags or /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to box_path(params["tag"]["box_id"]), notice: "Record Added to Box!!" }
        format.json { render :show, status: :created, location: @tag }
      else
        # flash.now[:messages] = @employee.errors.full_messages[0]
        format.html { redirect_back fallback_location: root_path, notice: "Record Already in Box!!" }
      end
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to box_path(params[:box_id]), notice: "Tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:box_id, :record_id)
    end
end

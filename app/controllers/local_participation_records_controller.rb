class LocalParticipationRecordsController < ApplicationController
  before_action :set_local_participation_record, only: [:show, :edit, :update, :destroy]

  # GET /local_participation_records
  # GET /local_participation_records.json
  def index
    @local_participation_records = LocalParticipationRecord.all
  end

  # GET /local_participation_records/1
  # GET /local_participation_records/1.json
  def show
  end

  # GET /local_participation_records/new
  def new
    @local_participation_record = LocalParticipationRecord.new
  end

  # GET /local_participation_records/1/edit
  def edit
  end

  # POST /local_participation_records
  # POST /local_participation_records.json
  def create
    @local_participation_record = LocalParticipationRecord.new(local_participation_record_params)

    respond_to do |format|
      if @local_participation_record.save
        format.html { redirect_to @local_participation_record, notice: 'Local participation record was successfully created.' }
        format.json { render :show, status: :created, location: @local_participation_record }
      else
        format.html { render :new }
        format.json { render json: @local_participation_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_participation_records/1
  # PATCH/PUT /local_participation_records/1.json
  def update
    respond_to do |format|
      if @local_participation_record.update(local_participation_record_params)
        format.html { redirect_to @local_participation_record, notice: 'Local participation record was successfully updated.' }
        format.json { render :show, status: :ok, location: @local_participation_record }
      else
        format.html { render :edit }
        format.json { render json: @local_participation_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_participation_records/1
  # DELETE /local_participation_records/1.json
  def destroy
    @local_participation_record.destroy
    respond_to do |format|
      format.html { redirect_to local_participation_records_url, notice: 'Local participation record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_participation_record
      @local_participation_record = LocalParticipationRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_participation_record_params
      params.require(:local_participation_record).permit(:user_id, :board_id, :num_moves, :num_invites, :xpos, :ypos)
    end
end

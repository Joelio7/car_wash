class WashRecordsController < ApplicationController
  def index
    @wash_records = WashRecord.all
  end

  def new
  @wash_record = WashRecord.new
  end

  def create
    @wash_record = current_user.wash_records.build(wash_record_params)
    if discount_requirements.include? @wash_record.license_plate
      @wash_record.amount_charged = @wash_record.amount_charged / 2
    end
    if @wash_record.save
      flash[:success] = "Wash record has been submitted. Car wash will be initiated momentarily"
      redirect_to new_wash_record_path
    else
      flash[:error] =  @wash_record.errors.full_messages
      redirect_to request.referer
    end
  end

  private
  def wash_record_params
    params.require(:wash_record).permit(:vehicle_type,:amount_charged,:muddy_bed,:bed_down,:license_plate)
  end
end

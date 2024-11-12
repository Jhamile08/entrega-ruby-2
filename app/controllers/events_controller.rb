class EventsController < ApplicationController
  before_action :set_event, only: %i[edit update show destroy]

  def index
    if params[:level].present?
      @events = Event.where(level: params[:level])
      @events = @events.by_exhibitor(params[:exhibitor]) if params[:exhibitor].present?
    else
      @events = Event.all
    end
  end

  def view
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def new
    @event = Event.new
  end

  def create
    # Crea un nuevo evento asociado al usuario actual
    @event = current_user.events.build(events_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(events_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_path, status: :see_other, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def events_params
    params.require(:event).permit(:eventName, :descripcion, :level, :exhibitor, :date)
  end

  def set_event
    @event = Event.find(params[:id])
    return unless @event.nil?

    redirect_to events_path, alert: 'Event not found'
  end
end

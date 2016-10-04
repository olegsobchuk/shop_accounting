class Assistant::AccountsController < AssistantController
  def show
    params[:from_date] ||= helpers.readable_date(Date.today)
    params[:to_date] ||= helpers.readable_date(Date.today)
    @things = things.sold_in(params[:from_date], params[:to_date])
    # binding.pry
  end

  private

  def things
    @things = current_assistant.things.decorate
  end
end

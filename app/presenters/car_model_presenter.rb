class CarModelPresenter < SimpleDelegator

  delegate :content_tag, :concat, to: :helper

  def initilizer(car_model)
    super(car_model)
  end

  def car_options
    content_tag(:ul) do
      __getobj__.car_options.each do |option|
        concat(content_tag(:li, option))
      end
    end
  end

  private

  def helper
    ApplicationController.helpers # Carregando todos os helpers dentro desse método.
  end

end
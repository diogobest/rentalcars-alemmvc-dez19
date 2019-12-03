class RentalPresenter < SimpleDelegator
  attr_reader :rental

  def initialize(rental)
    # @rental = rental
    super(rental) # chamando o initializer do simpledelegator
  end

  def status
    # if rental.scheduled?
    if scheduled?
      helper.content_tag :span, class: 'badge badge-primary' do
        'agendada'
      end
    elsif finalized?
      helper.content_tag :span, class: 'badge badge-success' do
        'finalizada'
      end
    elsif in_review?
      helper.content_tag :span, class: 'badge badge-warning' do
        'agendada'
      end
    else ongoing?
      helper.content_tag :span, class: 'badge badge-info' do
        'agendada'
      end
    end
  end

  private

  def helper
    ApplicationController.helpers # Carregando todos os helpers dentro desse método.
  end
  # private

  # def method_missing(method, *args, &block)
  #   rental.public_send(method, *args, &block)
  # end

  # def respond_to(method_name, include_private = false)
  #   rental.respond_to? method_name
  # end
end

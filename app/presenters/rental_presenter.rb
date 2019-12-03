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
          helper.t(rental.status)
        end
      elsif finalized?
        helper.content_tag :span, class: 'badge badge-success' do
          helper.t(rental.status)
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
class HomesController < ApplicationController
  def index
    @patients = Patient.all.last(9)

  end
end

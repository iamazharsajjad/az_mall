# frozen_string_literal: true

module Vendors
  class MainController < ApplicationController
    before_action :authenticate_vendor!
  end
end

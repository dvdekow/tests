class TestsController < ApplicationController

  require 'socket'

  def index
    @algo_one = AlgoOne.new
    @algo_two = AlgoTwo.new
    
    background do
      server = UDPSOCKET.new
      server.bind(nil, 1234)
      5.times do
      	text, sender = server.recvfrom(16)
      	@listen = text
      end
    end
  end

  def new

  end

  def background(&block)
    Thread.new do
      yield
      ActiveRecord::Base.connection.close
    end
  end
end

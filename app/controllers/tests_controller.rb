class TestsController < ApplicationController

  require 'socket'

  def index
    @algo_one = AlgoOne.new
    @algo_two = AlgoTwo.new
    @test = Test.new
    background do
      @server = UDPSocket.new
      @server.bind('localhost', 3000)
      100.times do
      	text, sender = @server.recvfrom(16)
        @test.listen = text
        @test.save
      end
      puts "i am in thread"
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

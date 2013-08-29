class TestsController < ApplicationController

  require 'socket'

  def index
    unless Algo.find(1)
      initCount
    end

    @algo_one = Algo.find(1)
    @algo_two = Algo.find(2)
    @date_updated = @algo_one.updated_at

    startMonitoring
  end

  def initCount
    @algo_one.product_view = 0
    @algo_one.recommendation_bought = 0
    @algo_one.recommendation_clicked = 0
    @algo_one.efficiency = 0
    @algo_one.save

    @algo_two.product_view = 0
    @algo_two.recommendation_bought = 0
    @algo_two.recommendation_clicked = 0
    @algo_two.efficiency = 0
    @algo_two.save
  end

  def startMonitoring
    @test = Test.new
    background do
      @server = UDPSocket.new
      @server.bind('localhost', 3000)
      100.times do
        text, sender = @server.recvfrom(32)
        identifyAction(text)
      end
      puts "i am in thread"
    end
  end

  def identifyAction(text)
      @response = text.split(' ')

      @test.listen = response(0)
      @test.product = response(1)
      @test.algo = response(2)
      @test.save
    
    if @test.algo.eql('algo1')
      if text.eql?('view')
        @algo_one.product_view += 1
        @algo_one.save
      elsif text.eql?('click')
        @algo_one.recommendation_clicked += 1
        @algo_one.save
      elsif text.eql?('bought')
        @algo_one.recommendation_bought += 1
        @algo_one.save
      end
    elsif @test.algo.eql('algo2')
      if text.eql?('view')
        @algo_two.product_view += 1
        @algo_two.save
      elsif text.eql?('click')
        @algo_two.recommendation_clicked += 1
        @algo_two.save
      elsif text.eql?('bought')
        @algo_two.recommendation_bought += 1
        @algo_two.save
      end
    end
  end

  def background(&block)
    Thread.new do
      yield
      ActiveRecord::Base.connection.close
    end
  end

  def detailview
    @algoused = params[:algo]
    @allview = Test.where(:listen => 'view')
  end

  def detailclicked
    @algoused = params[:algo]
    @allclick = Test.where(:listen => 'click')
  end

  def detailbought
    @algoused = params[:algo]
    @allbought = Test.where(:listen => 'bought')
  end

  def efficiency
    @algoused = params[:algo]
  end
end

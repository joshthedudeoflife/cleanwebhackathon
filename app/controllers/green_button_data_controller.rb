require "greenbutton"
require "open-uri"

class GreenButtonDataController < ApplicationController
  before_action :require_login
  
  def create
    # save the file
    gb_file = params[:file]
    filename = Rails.root.join('public', 'uploads', "#{Time.now.to_i}_#{gb_file.original_filename}")
    File.open(filename, 'wb') do |file|
      file.write(gb_file.read)
    end
    
    # parse data
    data = parse_gb(filename, (Time.now - 6.weeks).to_i, Time.now.to_i, 1.week.to_i, (3.years - 3.months).to_i)
    p data
    
    # create records
    ActiveRecord::Base.transaction do
      data.each_with_index do |d,i|
        next if i==0
        
        # parse metric              
        metric = (data[i-1][:value] - d[:value])/data[i-1][:value] * 100
        
        # create action      
        action = Actions::DataAction.create(user_id: session[:user_id], value: metric, created_at: Time.at(d[:stop]))
        log_activity(params[:challenge_id], action)
      end
    end
    
    # return values
    if success
      render json: true
    else
      render json: false
    end
  end
  
  private
  
  def parse_gb(source, start_time, stop_time, duration, offset)
    intervals = interval_readings(source, offset)
    interpolate_intervals(intervals, start_time, stop_time, duration)
  end
  
  
  def interval_readings(source, offset)
    # load the file and remove namespaces (not sure why this is needed...)
    if File.exist?(source)
      doc = Nokogiri.XML(File.open(source, 'rb'))
    else
      doc = Nokogiri.XML(open(source))
    end
    doc.remove_namespaces!
    
    # parse interval blocks
    interval_blocks = doc.css('IntervalBlock')
    p interval_blocks.length
    raise "More than one interval block"   if interval_blocks.length > 1
    
    readings = interval_blocks.first.css('IntervalReading')
    start = readings.css('start').map {|i| i.text.to_i + offset}
    duration = readings.css('duration').map {|i| i.text.to_i}
    kwh = readings.css('value').map {|i| i.text.to_i}
    
    reading_hash = start.zip(duration, kwh).inject([]) do |r,v|
      r << {start: v[0], stop: v[0] + v[1], duration: v[1], value: v[2]}
      r
    end
  end
  
  
  def interpolate_intervals(intervals, start_time, stop_time, duration)  
    results = []
    start_index = 0
    time_cursor = start_time
    while time_cursor < stop_time
      # generate the reading Hash
      r = {start: time_cursor, stop: time_cursor+duration, duration: duration, value: 0}
      
      # interate through data (efficiently)
      intervals[start_index...intervals.length].each_with_index do |d,i|
        if r[:start] > d[:stop]
          # keep moving until we are in the reading range
          next
          
        elsif r[:stop] <= d[:start]
          # check the stopping condition
          results << r
          start_index = i-1
          break
          
        else
          # inerpolate the values by computing the fraction of teh data block that overlaps the reading frame
          fraction = 1 - [0, (r[:start]-d[:start])/d[:duration].to_f].max - [0, (d[:stop]-r[:stop])/d[:duration].to_f].max
          r[:value] += fraction*d[:value]
        end
      end
      
      # increment the time cursor
      time_cursor += duration
    end
  
    # return results
    results
  end

end

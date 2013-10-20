class SubscriberList
  def initialize
    IO.readlines('subscriber_list.txt').map!{|e| e.strip!}.to_a
  end
end

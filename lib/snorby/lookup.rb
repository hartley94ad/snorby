require 'net/dns'
require 'net/dns/resolver'
require 'socket'
require 'whois'

module Snorby
  class Lookup
    
    Socket.do_not_reverse_lookup = false
    attr_accessor :address, :whois, :hostname, :dns
    
    def initialize(address)
      @address = address.to_s
    end
    
    def whois
      @whois = Whois::Client.new.query(@address)
    end
    
    def hostname
      @hostname = Socket::getaddrinfo('210.180.98.85',nil)[0][2]
    end
    
    def dns
      @dns ||= Resolver(@address)
    end
    
  end
end
require "lpp_Grupo3/version"
require "lpp_Grupo3/reference"
class List
    include Enumerable

    attr_accessor :head, :tail
    	
    def initialize(nodes)
    @Node = Struct.new(:value, :siguiente, :anterior)
    @head = nil
    @tail = nil
    @empty=true
    @first=true
    @lasteach = nil
    enqueque(nodes)
    end
    def insertar(node)
        if @empty == true
            @estenodo = @Node.new(node,nil,nil)
            @head=@estenodo
            @tail=@estenodo
            @empty=false
        else
            @estenodo = @Node.new(node,nil,@tail)
            @tail[:siguiente]=@estenodo
            @tail = @estenodo
        end
    end
    def dequeque
        if @head == @tail
            nodo = @head[:value]
            @head = nil
            @tail = nil
            @empty = true
        else
            nodo = @head[:value]
            @head = @head[:siguiente]
            @head[:anterior] = nil
        end
        nodo
    end
    def enqueque(nodo)
        insertar(nodo)
    end
    def enqueque(nodes)
        for i in (0.. nodes.size-1)
           insertar(nodes[i])
        end
    end
    def each
        @lasteach=nil
        while @lasteach != @tail
            if @lasteach==nil
                @lasteach=@head
            else
                @lasteach=@lasteach[:siguiente]
            end
            yield @lasteach[:value]
        end
    end
end
classdef FIFO<handle
    %FIFO FIFO class
    %   constructor: FIFO(width,depth) 
    %   write: FIFO.consume(w_req = 1), input data = FIFO.data_in
    %   read: FIFO.produce(r_req = 1), output data = FIFO.data_out
    %   status:FIFO.usedw
    %   status:FIFO.empty
    %   status:FIFO.full
    
    properties
        width;
        depth;
        fifo_array;
        data_in;
        data_out;
        head_index;%index of first element
        tail_index;%index of next store position
        usedw;
        empty;
        full;
    end
    
    methods
        function obj = FIFO(varargin)
            %property setup
            narginchk(0,2);
            if nargin ==0
                obj.width = uint16(8);
                obj.depth = uint16(8);
            elseif nargin == 1
                obj.width = uint16(varargin{1});
            else
                obj.width = uint16(varargin{1});
                obj.depth = uint16(varargin{2});
            end
            
            %fifo_array init
            obj.fifo_array = {};
            for index = 1:obj.depth
                obj.fifo_array{index} = PIXEL();
            end
            
            obj.data_in = PIXEL();
            obj.data_out = PIXEL();
            obj.head_index = 1;
            obj.tail_index = 1;
            
            obj.usedw = 0;
            obj.empty = 1;
            obj.full = 0;
        end
        function consume(obj,w_req)
            if w_req == 1
                if obj.usedw < obj.depth
                    obj.fifo_array{obj.tail_index} = obj.data_in;
                    obj.tail_index = obj.tail_index + 1;
                    obj.usedw = obj.usedw +1;
                    if obj.tail_index > obj.depth
                        obj.tail_index = 1;
                    end
                else
                    obj.full = 1;
                end
            end
        end
        function produce(obj,r_req)
            if r_req == 1
                if obj.usedw > 0
                    obj.data_out = obj.fifo_array{obj.head_index};
                    obj.head_index = obj.head_index + 1;
                    obj.usedw = obj.usedw -1;
                    if obj.head_index > obj.depth
                        obj.head_index = 1;
                    end
                else
                    obj.empty = 1;
                end
            end
        end        
    end
    
end


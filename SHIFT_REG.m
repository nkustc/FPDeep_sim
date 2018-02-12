classdef SHIFT_REG<handle
   %SHIFT_REG SHIFT REGISTER class
    %   constructor: SHIFT_REG(depth) 
    %   write: SHIFT_REG.consume(w_req = 1), input data = SHIFT_REG.data_in
    %   read: SHIFT_REG.produce(r_req = 1), output data = SHIFT_REG.data_out


    
    properties
        depth;
        reg_array;
        in_latch;
        data_in;
        data_out;
        data_disp;
    end
    
    methods
        function obj = SHIFT_REG(varargin)
            narginchk(0,1);
            if nargin == 0
                obj.depth = 8;
            else
                obj.depth = varargin{1};
            end
            % reg_array init
            % data_disp init
            obj.reg_array = {};
            obj.data_disp = {};
            for index = 1:obj.depth
                obj.reg_array{index} = PIXEL();
                obj.data_disp{index} = PIXEL();
            end
            %obj.data_disp = obj.reg_array;
            obj.data_in = PIXEL();
            obj.data_out = PIXEL();
            obj.in_latch = PIXEL();
        end
        
        function consume(obj,w_req)
            if w_req == 1
               obj.in_latch = obj.data_in; 
            end
        end
        function produce(obj,r_req)
            if r_req == 1
                obj.data_out = obj.reg_array{1};
                for index = 2:obj.depth
                    obj.reg_array{index-1} = obj.reg_array{index};
                end
                obj.reg_array{obj.depth} = obj.in_latch;
                obj.data_disp = obj.reg_array;
            end

        end
    end
    
end


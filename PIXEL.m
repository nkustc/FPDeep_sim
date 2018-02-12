classdef PIXEL<handle
    %UNTITLED4 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        avail;
        data;
    end
    
    methods
        function obj = PIXEL(varargin)
            narginchk(0,1);
            if nargin == 0
                obj.avail = false;
                obj.data = 0;
            else
                obj.avail = true;
                obj.data = varargin{1};
            end
        end
        function pix_set(obj,value)
           obj.data = value;
           obj.avail = true;
        end
    end
    
end


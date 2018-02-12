classdef FP_MODULE
    %FP_MODULE in FPDeep
    %   FP_MODULE(SS,Ci,K,Bp)
    
    properties
        SS;
        Ci;
        K;
        Bp;
    end
    
    methods
        function obj = FP_MODULE(varargin)
            narginchk(0,4);
            if nargin == 0
                obj.SS = 2;
                obj.Ci = 2;
                obj.K = 3;
                obj.Bp = 3;
            elseif nargin == 1
                obj.SS = varargin{1};
                obj.Ci = 2;
                obj.K = 3;
                obj.Bp = 3;
            elseif nargin == 2
                obj.SS = varargin{1};
                obj.Ci = varargin{2};
                obj.K = 3;
                obj.Bp = 3;
            elseif nargin == 3
                obj.SS = varargin{1};
                obj.Ci = varargin{2};
                obj.K = varargin{3};
                obj.Bp = 3;
            else
                obj.SS = varargin{1};
                obj.Ci = varargin{2};
                obj.K = varargin{3};
                obj.Bp = varargin{4};
            end
        end
        function ret = produce()
        end
        function ret = consume()
        end        
    end
    
end


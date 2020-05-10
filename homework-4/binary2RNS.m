function varargout = binary2RNS(varargin)

if nargin == 1
    n = varargin{1};

    m = [2 .^ n - 1, 2 .^ n, 2 .^ n + 1];
    M = prod(m);

    varargout{1} = M;
else
    X = varargin{1};
    n = varargin{2};

    m = [2 .^ n - 1, 2 .^ n, 2 .^ n + 1];
    M = prod(m);

    x = mod(X, m);

    varargout{1} = x;
    varargout{2} = M;
end

end
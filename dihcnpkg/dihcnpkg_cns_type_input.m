function varargout = dihcnpkg_cns_type_input(method, varargin)

[varargout{1 : nargout}] = feval(['method_' method], varargin{:});

return;

%***********************************************************************************************************************

function p = method_props

p.super  = 'layer';
p.blockYSize = 16;
p.blockXSize = 8;

return;

%***********************************************************************************************************************

function d = method_fields

d = struct;
d.zin = {'lz', 'type', 'index'};
d.input = {'la', 'dnames', {'y' 'x' 'd'}, 'dims', {1 2 1}, 'dparts', {1 1 2}};

return;
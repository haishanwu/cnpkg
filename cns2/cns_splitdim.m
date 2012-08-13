function s = cns_splitdim(n, numParts)

% CNS_SPLITDIM
%    Click <a href="matlab: cns_help('cns_splitdim')">here</a> for help.

%***********************************************************************************************************************

% Copyright (C) 2009 by Jim Mutch (www.jimmutch.com).
%
% This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public
% License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later
% version.
%
% This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
% warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License along with this program.  If not, see
% <http://www.gnu.org/licenses/>.

%***********************************************************************************************************************

if nargin < 2
    numParts = 2;
elseif numParts < 1
    error('invalid number of parts');
end

if numel(n) == numParts
    s = reshape(n, 1, []);
    return;
end

if ~isscalar(n), error('invalid size'); end

if n == 0

    s = [ones(1, numParts - 1), 0];

else

    f = factor(n);

    s = [ones(1, numParts - 1), prod(f(f > 2))];

    for i = 1 : sum(f == 2)
        [ans, j] = min(s);
        s(j) = s(j) * 2;
    end

end

return;